import 'dart:async';

import 'package:dewakoding_presensi/app/module/entity/attendance.dart';
import 'package:dewakoding_presensi/app/module/entity/schedule.dart';
import 'package:dewakoding_presensi/app/module/use_case/attendance_send.dart';
import 'package:dewakoding_presensi/app/module/use_case/schedule_banned.dart';
import 'package:dewakoding_presensi/app/module/use_case/schedule_get.dart';
import 'package:dewakoding_presensi/core/helper/date_time_helper.dart';
import 'package:dewakoding_presensi/core/helper/location_helper.dart';
import 'package:dewakoding_presensi/core/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:geolocator/geolocator.dart';

class MapNotifier extends AppProvider {
  final ScheduleGetUseCase _scheduleGetUseCase;
  final AttendanceSendUseCase _attendanceSendUseCase;
  final ScheduleBannedUseCase _scheduleBannedUseCase;
  MapNotifier(this._scheduleGetUseCase, this._attendanceSendUseCase,
      this._scheduleBannedUseCase) {
    init();
  }

  bool _isSuccess = false;
  bool _isEnableSubmitButton = false;
  MapController _mapController = MapController.withPosition(
      initPosition:
          GeoPoint(latitude: -6.17549964024, longitude: 106.827149391));
  ScheduleEntity? _schedule;
  late CircleOSM _circle;
  bool _isGrantedLocation = false;
  bool _isEnabledLocation = false;
  late StreamSubscription<Position> _streamCurrentLocation;
  GeoPoint? _currentLocation;

  bool get isSuccess => _isSuccess;
  bool get isEnableSubmitButton => _isEnableSubmitButton;
  MapController get mapController => _mapController;

  ScheduleEntity? get schedule => _schedule;

  bool get isGrantedLocaiton => _isGrantedLocation;
  bool get isEnabledLocation => _isEnabledLocation;

  @override
  void init() async {
    await _getEnableAndPermission();
    await _getSchedule();
    if (errorMessage.isEmpty) _checkShift();
  }

  _getEnableAndPermission() async {
    showLoading();
    _isGrantedLocation = await LocationHelper.isGrantedLocationPermission();
    if (_isGrantedLocation) {
      _isEnabledLocation = await LocationHelper.isEnabledLocationService();
      if (!_isEnabledLocation) {
        errorMeesage = 'Harap mengaktifkan GPS';
      }
    } else {
      errorMeesage = 'Harap menyetujui permission';
    }
    hideLoading();
  }

  _getSchedule() async {
    showLoading();
    final response = await _scheduleGetUseCase();
    if (response.success) {
      _schedule = response.data!;
      _circle = CircleOSM(
          key: 'Center-Point',
          centerPoint: GeoPoint(
              latitude: _schedule!.office.latitude,
              longitude: _schedule!.office.longitude),
          radius: _schedule!.office.radius,
          color: Colors.red.withOpacity(0.5),
          strokeWidth: 2,
          borderColor: Colors.red);
    } else {
      errorMeesage = response.message;
    }
    hideLoading();
  }

  _checkShift() {
    final now = DateTime.now();
    final startTimeShift = _schedule!.shift.startTime.split(':');
    final dateTimeShift = DateTime(
        now.year,
        now.month,
        now.day,
        int.parse(startTimeShift[0]),
        int.parse(startTimeShift[1]),
        int.parse(startTimeShift[2]));
    if (DateTimeHelper.getDifference(a: now, b: dateTimeShift) >
        Duration(minutes: 30)) {
      errorMeesage =
          'Kehadiran dapat dibuat paling cepat 30 menit sebelum shift dimulai';
    }
  }

  checkLocationPermission() async {
    _isGrantedLocation = await LocationHelper.isGrantedLocationPermission();
    if (!_isGrantedLocation && !isDispose) {
      checkLocationPermission();
    } else {
      errorMeesage = '';
      init();
    }
  }

  checkLocationService() async {
    _isEnabledLocation = await LocationHelper.isEnabledLocationService();
    if (!_isEnabledLocation && !isDispose) {
      checkLocationService();
    } else {
      errorMeesage = '';
      init();
    }
  }

  mapIsReady() async {
    _openStreamCurrentLocation();
    await mapController.drawCircle(_circle);
  }

  _openStreamCurrentLocation() async {
    _streamCurrentLocation = Geolocator.getPositionStream().listen(
      (position) {
        if (position.isMocked) {
          _closeStreamCurrentLocation();
          _sendBanned();
        } else {
          if (!isDispose && !isLoading) {
            if (_currentLocation != null) {
              _mapController.removeMarker(_currentLocation!);
            }
            _currentLocation = GeoPoint(
                latitude: position.latitude, longitude: position.longitude);
            _mapController.addMarker(_currentLocation!,
                markerIcon: const MarkerIcon(
                  icon: Icon(
                    Icons.account_circle,
                    color: Colors.red,
                    size: 30,
                  ),
                ));
            _mapController.moveTo(_currentLocation!, animate: true);
            _validationSubmitButton();
          } else {
            _closeStreamCurrentLocation();
          }
        }
      },
    );
  }

  _closeStreamCurrentLocation() {
    _streamCurrentLocation.cancel();
  }

  _validationSubmitButton() {
    if (_schedule!.isWfa) {
      if (!_isEnableSubmitButton) {
        _isEnableSubmitButton = true;
        notifyListeners();
      }
    } else {
      final inCircle =
          LocationHelper.isLocationInCircle(_circle, _currentLocation!);
      if (inCircle != _isEnableSubmitButton) {
        _isEnableSubmitButton = inCircle;
        notifyListeners();
      }
    }
  }

  send() async {
    showLoading();
    final response = await _attendanceSendUseCase(
        param: AttendanceParamEntity(
            latitude: _currentLocation!.latitude,
            longitude: _currentLocation!.longitude));
    if (response.success) {
      _isSuccess = true;
    } else {
      snackbarMessage = response.message;
    }
    hideLoading();
  }

  _sendBanned() async {
    showLoading();
    final response = await _scheduleBannedUseCase();
    if (response.success) {
      _getSchedule();
    } else {
      errorMeesage = response.message;
    }
    hideLoading();
  }
}

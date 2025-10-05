import 'package:dewakoding_presensi/core/helper/dialog_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:geolocator/geolocator.dart';

class LocationHelper {
  static Future<bool> isGrantedLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return false;
    } else {
      return true;
    }
  }

  static Future<bool> isEnabledLocationService() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    return serviceEnabled;
  }

  static Future<bool> openLocationSetting() async {
    return await Geolocator.openLocationSettings();
  }

  static Future<bool> showDialogLocationPermission(BuildContext context) async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        DialogHelper.showSnackbar(
            context: context, text: "Perizinan lokasi ditolak");
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Geolocator.openAppSettings();
      return false;
    }

    return true;
  }

  static bool isLocationInCircle(CircleOSM circle, GeoPoint currentLocation) {
    double distance = Geolocator.distanceBetween(
        currentLocation.latitude,
        currentLocation.longitude,
        circle.centerPoint.latitude,
        circle.centerPoint.longitude);
    return distance <= circle.radius;
  }
}

import 'package:adhan/adhan.dart';
import 'package:dewakoding_presensi/core/helper/prayer_helper.dart';
import 'package:dewakoding_presensi/core/helper/notification_helper.dart';
import 'package:dewakoding_presensi/core/provider/app_provider.dart';
import 'package:geolocator/geolocator.dart';

class PrayerNotifier extends AppProvider {
  PrayerTimes? _prayerTimes;
  bool _notificationEnabled = false;
  double? _latitude;
  double? _longitude;
  String? _localErrorMessage;
  
  Map<String, bool> _prayerEnabled = {
    'Subuh': true,
    'Dzuhur': true,
    'Ashar': true,
    'Maghrib': true,
    'Isya': true,
  };

  PrayerNotifier() {
    // Load initial data without blocking constructor
    _loadInitialData();
  }

  void _loadInitialData() {
    // Schedule init to run after constructor completes
    Future.microtask(() => init());
  }

  PrayerTimes? get prayerTimes => _prayerTimes;
  bool get notificationEnabled => _notificationEnabled;
  double? get latitude => _latitude;
  double? get longitude => _longitude;
  String? get localErrorMessage => _localErrorMessage;
  Map<String, bool> get prayerEnabled => _prayerEnabled;

  @override
  Future<void> init() async {
    showLoading();
    _localErrorMessage = null;

    try {
      // Load notification settings
      _notificationEnabled = await PrayerHelper.isPrayerNotificationEnabled();
      
      // Load prayer enabled settings
      for (var prayer in _prayerEnabled.keys) {
        _prayerEnabled[prayer] = await PrayerHelper.isPrayerEnabled(prayer);
      }

      // Load saved location
      final location = await PrayerHelper.getLocation();
      if (location != null) {
        _latitude = location['latitude'];
        _longitude = location['longitude'];
        await _calculatePrayerTimes(_latitude!, _longitude!);
      }
    } catch (e) {
      _localErrorMessage = e.toString();
    } finally {
      hideLoading();
    }
  }

  Future<void> getCurrentLocation() async {
    showLoading();
    _localErrorMessage = null;

    try {
      // Check permission
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception('Izin lokasi ditolak');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception('Izin lokasi ditolak secara permanen. Silakan aktifkan di pengaturan');
      }

      // Get current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      _latitude = position.latitude;
      _longitude = position.longitude;

      // Save location
      await PrayerHelper.saveLocation(_latitude!, _longitude!);

      // Calculate prayer times and reschedule if needed
      await _calculatePrayerTimes(_latitude!, _longitude!, reschedule: true);
    } catch (e) {
      _localErrorMessage = e.toString();
    } finally {
      hideLoading();
    }
  }

  Future<void> setCustomLocation(double latitude, double longitude) async {
    showLoading();
    _localErrorMessage = null;

    try {
      _latitude = latitude;
      _longitude = longitude;

      // Save location
      await PrayerHelper.saveLocation(latitude, longitude);

      // Calculate prayer times and reschedule if needed
      await _calculatePrayerTimes(latitude, longitude, reschedule: true);
    } catch (e) {
      _localErrorMessage = e.toString();
    } finally {
      hideLoading();
    }
  }

  Future<void> _calculatePrayerTimes(double latitude, double longitude, {bool reschedule = false}) async {
    _prayerTimes = await PrayerHelper.calculatePrayerTimes(latitude, longitude);
    
    // Schedule notifications if enabled and reschedule is true
    if (_notificationEnabled && reschedule) {
      await PrayerHelper.scheduleAllPrayerNotifications(_prayerTimes!);
    }
  }

  Future<void> toggleNotification(bool value) async {
    _notificationEnabled = value;
    await PrayerHelper.setPrayerNotificationEnabled(value);

    if (value && _prayerTimes != null) {
      // Request permission first
      final isGranted = await NotificationHelper.isPermissionGranted();
      if (!isGranted) {
        final granted = await NotificationHelper.requestPermission();
        if (!granted) {
          _notificationEnabled = false;
          await PrayerHelper.setPrayerNotificationEnabled(false);
          _localErrorMessage = 'Izin notifikasi ditolak';
          notifyListeners();
          return;
        }
      }
      
      await PrayerHelper.scheduleAllPrayerNotifications(_prayerTimes!);
    } else {
      await PrayerHelper.cancelAllPrayerNotifications();
    }

    notifyListeners();
  }

  Future<void> togglePrayer(String prayer, bool value) async {
    _prayerEnabled[prayer] = value;
    await PrayerHelper.setPrayerEnabled(prayer, value);

    // Reschedule notifications
    if (_notificationEnabled && _prayerTimes != null) {
      await PrayerHelper.scheduleAllPrayerNotifications(_prayerTimes!);
    }

    notifyListeners();
  }

  String formatTime(DateTime dateTime) {
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}

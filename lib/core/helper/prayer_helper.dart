import 'package:adhan/adhan.dart';
import 'package:dewakoding_presensi/core/helper/notification_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrayerHelper {
  static const String _keyPrayerNotificationEnabled = 'prayer_notification_enabled';
  static const String _keyLatitude = 'prayer_latitude';
  static const String _keyLongitude = 'prayer_longitude';
  static const String _keyFajrEnabled = 'prayer_fajr_enabled';
  static const String _keyDhuhrEnabled = 'prayer_dhuhr_enabled';
  static const String _keyAsrEnabled = 'prayer_asr_enabled';
  static const String _keyMaghribEnabled = 'prayer_maghrib_enabled';
  static const String _keyIshaEnabled = 'prayer_isha_enabled';

  // Notification IDs for each prayer
  static const int _fajrId = 100;
  static const int _dhuhrId = 101;
  static const int _asrId = 102;
  static const int _maghribId = 103;
  static const int _ishaId = 104;

  static Future<PrayerTimes> calculatePrayerTimes(double latitude, double longitude) async {
    final coordinates = Coordinates(latitude, longitude);
    final params = CalculationMethod.singapore.getParameters();
    params.madhab = Madhab.shafi;
    
    final prayerTimes = PrayerTimes.today(coordinates, params);
    return prayerTimes;
  }

  static Future<void> saveLocation(double latitude, double longitude) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_keyLatitude, latitude);
    await prefs.setDouble(_keyLongitude, longitude);
  }

  static Future<Map<String, double>?> getLocation() async {
    final prefs = await SharedPreferences.getInstance();
    final latitude = prefs.getDouble(_keyLatitude);
    final longitude = prefs.getDouble(_keyLongitude);
    
    if (latitude == null || longitude == null) return null;
    
    return {'latitude': latitude, 'longitude': longitude};
  }

  static Future<void> setPrayerNotificationEnabled(bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyPrayerNotificationEnabled, enabled);
  }

  static Future<bool> isPrayerNotificationEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyPrayerNotificationEnabled) ?? false;
  }

  static Future<void> setPrayerEnabled(String prayer, bool enabled) async {
    final prefs = await SharedPreferences.getInstance();
    String key = '';
    
    switch (prayer) {
      case 'Subuh':
        key = _keyFajrEnabled;
        break;
      case 'Dzuhur':
        key = _keyDhuhrEnabled;
        break;
      case 'Ashar':
        key = _keyAsrEnabled;
        break;
      case 'Maghrib':
        key = _keyMaghribEnabled;
        break;
      case 'Isya':
        key = _keyIshaEnabled;
        break;
    }
    
    await prefs.setBool(key, enabled);
  }

  static Future<bool> isPrayerEnabled(String prayer) async {
    final prefs = await SharedPreferences.getInstance();
    String key = '';
    
    switch (prayer) {
      case 'Subuh':
        key = _keyFajrEnabled;
        break;
      case 'Dzuhur':
        key = _keyDhuhrEnabled;
        break;
      case 'Ashar':
        key = _keyAsrEnabled;
        break;
      case 'Maghrib':
        key = _keyMaghribEnabled;
        break;
      case 'Isya':
        key = _keyIshaEnabled;
        break;
    }
    
    return prefs.getBool(key) ?? true;
  }

  static Future<void> scheduleAllPrayerNotifications(PrayerTimes prayerTimes) async {
    final isEnabled = await isPrayerNotificationEnabled();
    if (!isEnabled) {
      // Only cancel if notifications are disabled
      await cancelAllPrayerNotifications();
      return;
    }

    // Cancel existing prayer notifications before rescheduling
    await cancelAllPrayerNotifications();

    // Schedule Fajr
    if (await isPrayerEnabled('Subuh')) {
      await NotificationHelper.scheduleNotification(
        id: _fajrId,
        title: '🕌 Waktu Sholat Subuh',
        body: 'Sudah masuk waktu sholat Subuh. Yuk segera menunaikan sholat!',
        hour: prayerTimes.fajr.hour,
        minutes: prayerTimes.fajr.minute,
      );
    }

    // Schedule Dhuhr
    if (await isPrayerEnabled('Dzuhur')) {
      await NotificationHelper.scheduleNotification(
        id: _dhuhrId,
        title: '🕌 Waktu Sholat Dzuhur',
        body: 'Sudah masuk waktu sholat Dzuhur. Yuk segera menunaikan sholat!',
        hour: prayerTimes.dhuhr.hour,
        minutes: prayerTimes.dhuhr.minute,
      );
    }

    // Schedule Asr
    if (await isPrayerEnabled('Ashar')) {
      await NotificationHelper.scheduleNotification(
        id: _asrId,
        title: '🕌 Waktu Sholat Ashar',
        body: 'Sudah masuk waktu sholat Ashar. Yuk segera menunaikan sholat!',
        hour: prayerTimes.asr.hour,
        minutes: prayerTimes.asr.minute,
      );
    }

    // Schedule Maghrib
    if (await isPrayerEnabled('Maghrib')) {
      await NotificationHelper.scheduleNotification(
        id: _maghribId,
        title: '🕌 Waktu Sholat Maghrib',
        body: 'Sudah masuk waktu sholat Maghrib. Yuk segera menunaikan sholat!',
        hour: prayerTimes.maghrib.hour,
        minutes: prayerTimes.maghrib.minute,
      );
    }

    // Schedule Isha
    if (await isPrayerEnabled('Isya')) {
      await NotificationHelper.scheduleNotification(
        id: _ishaId,
        title: '🕌 Waktu Sholat Isya',
        body: 'Sudah masuk waktu sholat Isya. Yuk segera menunaikan sholat!',
        hour: prayerTimes.isha.hour,
        minutes: prayerTimes.isha.minute,
      );
    }
  }

  static Future<void> cancelAllPrayerNotifications() async {
    final plugin = NotificationHelper.flutterLocalNotificationsPlugin;
    
    try {
      // Cancel each prayer notification individually
      await plugin.cancel(_fajrId);
    } catch (e) {
      print('Error canceling Fajr notification: $e');
    }
    
    try {
      await plugin.cancel(_dhuhrId);
    } catch (e) {
      print('Error canceling Dhuhr notification: $e');
    }
    
    try {
      await plugin.cancel(_asrId);
    } catch (e) {
      print('Error canceling Asr notification: $e');
    }
    
    try {
      await plugin.cancel(_maghribId);
    } catch (e) {
      print('Error canceling Maghrib notification: $e');
    }
    
    try {
      await plugin.cancel(_ishaId);
    } catch (e) {
      print('Error canceling Isha notification: $e');
    }
  }
}

import 'package:dewakoding_presensi/app/presentation/prayer/prayer_notifier.dart';
import 'package:dewakoding_presensi/core/helper/global_helper.dart';
import 'package:dewakoding_presensi/core/widget/app_widget.dart';
import 'package:flutter/material.dart';

class PrayerScreen extends AppWidget<PrayerNotifier, void, void> {
  @override
  Widget bodyBuild(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifikasi Sholat'),
        backgroundColor: GlobalHelper.getColorSchema(context).primary,
        foregroundColor: GlobalHelper.getColorSchema(context).onPrimary,
      ),
      body: notifier.isLoading
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () => notifier.init(),
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLocationSection(context),
                      SizedBox(height: 20),
                      _buildNotificationToggle(context),
                      SizedBox(height: 20),
                      if (notifier.prayerTimes != null) ...[
                        _buildPrayerTimesSection(context),
                        SizedBox(height: 20),
                        _buildPrayerNotificationSettings(context),
                      ],
                      if (notifier.localErrorMessage != null)
                        _buildErrorMessage(context),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildLocationSection(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.location_on,
                    color: GlobalHelper.getColorSchema(context).primary),
                SizedBox(width: 8),
                Text(
                  'Lokasi',
                  style: GlobalHelper.getTextStyle(context,
                      appTextStyle: AppTextStyle.TITLE_LARGE),
                ),
              ],
            ),
            SizedBox(height: 12),
            if (notifier.latitude != null && notifier.longitude != null)
              Text(
                'Lat: ${notifier.latitude!.toStringAsFixed(4)}, Long: ${notifier.longitude!.toStringAsFixed(4)}',
                style: GlobalHelper.getTextStyle(context,
                    appTextStyle: AppTextStyle.BODY_MEDIUM),
              )
            else
              Text(
                'Lokasi belum diatur',
                style: GlobalHelper.getTextStyle(context,
                        appTextStyle: AppTextStyle.BODY_MEDIUM)
                    ?.copyWith(fontStyle: FontStyle.italic),
              ),
            SizedBox(height: 12),
            Container(
              width: double.maxFinite,
              child: FilledButton.icon(
                onPressed: () => _onPressGetLocation(context),
                icon: Icon(Icons.my_location),
                label: Text('Gunakan Lokasi Saat Ini'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationToggle(BuildContext context) {
    final isEnabled = notifier.notificationEnabled;
    
    return Card(
      elevation: 2,
      color: isEnabled 
          ? GlobalHelper.getColorSchema(context).primaryContainer.withOpacity(0.3)
          : null,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SwitchListTile(
              title: Row(
                children: [
                  Text(
                    'Aktifkan Notifikasi Sholat',
                    style: GlobalHelper.getTextStyle(context,
                        appTextStyle: AppTextStyle.TITLE_MEDIUM),
                  ),
                  SizedBox(width: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: isEnabled ? Colors.green : Colors.grey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      isEnabled ? 'AKTIF' : 'NONAKTIF',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              subtitle: Text(
                isEnabled 
                    ? '✅ Anda akan menerima pengingat waktu sholat'
                    : 'Dapatkan pengingat waktu sholat',
                style: GlobalHelper.getTextStyle(context,
                    appTextStyle: AppTextStyle.BODY_SMALL),
              ),
              value: notifier.notificationEnabled,
              onChanged: (value) => notifier.toggleNotification(value),
              activeColor: GlobalHelper.getColorSchema(context).primary,
            ),
            if (isEnabled)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, 
                        size: 16, 
                        color: GlobalHelper.getColorSchema(context).primary),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Notifikasi akan muncul setiap hari pada waktu yang ditentukan',
                        style: GlobalHelper.getTextStyle(context,
                            appTextStyle: AppTextStyle.BODY_SMALL)?.copyWith(
                          fontStyle: FontStyle.italic,
                          color: GlobalHelper.getColorSchema(context).primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildPrayerTimesSection(BuildContext context) {
    final prayerTimes = notifier.prayerTimes!;
    
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.access_time,
                    color: GlobalHelper.getColorSchema(context).primary),
                SizedBox(width: 8),
                Text(
                  'Jadwal Sholat Hari Ini',
                  style: GlobalHelper.getTextStyle(context,
                      appTextStyle: AppTextStyle.TITLE_LARGE),
                ),
              ],
            ),
            SizedBox(height: 16),
            _buildPrayerTimeItem(
                context, '🌅 Subuh', notifier.formatTime(prayerTimes.fajr)),
            _buildPrayerTimeItem(
                context, '☀️ Dzuhur', notifier.formatTime(prayerTimes.dhuhr)),
            _buildPrayerTimeItem(
                context, '🌤️ Ashar', notifier.formatTime(prayerTimes.asr)),
            _buildPrayerTimeItem(context, '🌆 Maghrib',
                notifier.formatTime(prayerTimes.maghrib)),
            _buildPrayerTimeItem(
                context, '🌙 Isya', notifier.formatTime(prayerTimes.isha)),
          ],
        ),
      ),
    );
  }

  Widget _buildPrayerTimeItem(BuildContext context, String name, String time) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: GlobalHelper.getTextStyle(context,
                appTextStyle: AppTextStyle.BODY_LARGE),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: GlobalHelper.getColorSchema(context).primaryContainer,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              time,
              style: GlobalHelper.getTextStyle(context,
                      appTextStyle: AppTextStyle.TITLE_MEDIUM)
                  ?.copyWith(
                fontWeight: FontWeight.bold,
                color: GlobalHelper.getColorSchema(context).primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrayerNotificationSettings(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.notifications_active,
                    color: GlobalHelper.getColorSchema(context).primary),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Pengaturan Notifikasi',
                    style: GlobalHelper.getTextStyle(context,
                        appTextStyle: AppTextStyle.TITLE_LARGE),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              notifier.notificationEnabled
                  ? 'Pilih waktu sholat mana yang ingin diingatkan'
                  : 'Aktifkan notifikasi sholat terlebih dahulu untuk mengatur pengingat',
              style: GlobalHelper.getTextStyle(context,
                  appTextStyle: AppTextStyle.BODY_SMALL)?.copyWith(
                color: notifier.notificationEnabled 
                    ? null 
                    : Colors.orange.shade700,
                fontWeight: notifier.notificationEnabled 
                    ? null 
                    : FontWeight.w500,
              ),
            ),
            SizedBox(height: 12),
            Opacity(
              opacity: notifier.notificationEnabled ? 1.0 : 0.5,
              child: Column(
                children: [
                  _buildPrayerToggle(context, 'Subuh', '🌅'),
                  _buildPrayerToggle(context, 'Dzuhur', '☀️'),
                  _buildPrayerToggle(context, 'Ashar', '🌤️'),
                  _buildPrayerToggle(context, 'Maghrib', '🌆'),
                  _buildPrayerToggle(context, 'Isya', '🌙'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPrayerToggle(BuildContext context, String prayer, String emoji) {
    final isEnabled = notifier.prayerEnabled[prayer] ?? true;
    
    return SwitchListTile(
      title: Row(
        children: [
          Text(
            '$emoji $prayer',
            style: GlobalHelper.getTextStyle(context,
                appTextStyle: AppTextStyle.BODY_LARGE),
          ),
          SizedBox(width: 8),
          if (notifier.notificationEnabled)
            Icon(
              isEnabled ? Icons.notifications_active : Icons.notifications_off,
              size: 18,
              color: isEnabled 
                  ? GlobalHelper.getColorSchema(context).primary 
                  : Colors.grey,
            ),
        ],
      ),
      value: isEnabled,
      onChanged: notifier.notificationEnabled
          ? (value) => notifier.togglePrayer(prayer, value)
          : null,
      activeColor: GlobalHelper.getColorSchema(context).primary,
      contentPadding: EdgeInsets.zero,
    );
  }

  Widget _buildErrorMessage(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.red.shade200),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline, color: Colors.red),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              notifier.localErrorMessage!,
              style: TextStyle(color: Colors.red.shade900),
            ),
          ),
        ],
      ),
    );
  }

  void _onPressGetLocation(BuildContext context) async {
    await notifier.getCurrentLocation();
    
    if (notifier.localErrorMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(notifier.localErrorMessage!),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Lokasi berhasil diperbarui'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }
}

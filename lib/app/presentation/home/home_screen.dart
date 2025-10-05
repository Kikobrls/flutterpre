import 'package:dewakoding_presensi/app/module/entity/attendance.dart';
import 'package:dewakoding_presensi/app/presentation/detail_attendance/detail_attendance_screen.dart';
import 'package:dewakoding_presensi/app/presentation/face_recognition/face_recognition_screen.dart';
import 'package:dewakoding_presensi/app/presentation/home/home_notifier.dart';
import 'package:dewakoding_presensi/app/presentation/leave/leave_screen.dart';
import 'package:dewakoding_presensi/app/presentation/login/login_screen.dart';
import 'package:dewakoding_presensi/app/presentation/prayer/prayer_screen.dart';
import 'package:dewakoding_presensi/core/helper/date_time_helper.dart';
import 'package:dewakoding_presensi/core/helper/dialog_helper.dart';
import 'package:dewakoding_presensi/core/helper/global_helper.dart';
import 'package:dewakoding_presensi/core/helper/shared_preferences_helper.dart';
import 'package:dewakoding_presensi/core/widget/app_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends AppWidget<HomeNotifier, void, void> {
  @override
  Widget bodyBuild(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () => notifier.init(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _headerLayout(context),
              _todayLayout(context),
              _thisMonthLayout(context)
            ],
          ),
        ),
      ),
    );
  }

  _headerLayout(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
      child: Row(
        children: [
          CircleAvatar(
            child: Icon(
              Icons.person,
              size: 40,
            ),
            backgroundColor:
                GlobalHelper.getColorSchema(context).primaryContainer,
            radius: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notifier.name,
                  style: GlobalHelper.getTextStyle(context,
                          appTextStyle: AppTextStyle.HEADLINE_SMALL)
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                (notifier.isLeaves)
                    ? SizedBox()
                    : Row(
                        children: [
                          Expanded(
                              child: Row(
                            children: [
                              Icon(Icons.location_city),
                              SizedBox(
                                width: 5,
                              ),
                              Text(notifier.schedule?.office.name ?? ''),
                            ],
                          )),
                          Expanded(
                              child: Row(
                            children: [
                              Icon(Icons.access_time),
                              SizedBox(
                                width: 5,
                              ),
                              Text(notifier.schedule?.shift.name ?? '')
                            ],
                          ))
                        ],
                      )
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          IconButton(
              onPressed: () => _onPressMenu(context), icon: Icon(Icons.menu))
        ],
      ),
    );
  }

  _todayLayout(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: GlobalHelper.getColorSchema(context).primary),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: GlobalHelper.getColorSchema(context).onPrimary),
                child: Row(
                  children: [
                    Icon(Icons.today),
                    SizedBox(
                      width: 5,
                    ),
                    Text(DateTimeHelper.formatDateTime(
                        dateTime: DateTime.now(), format: 'EEE, dd MMM yyyy')),
                  ],
                ),
              ),
              Expanded(child: SizedBox()),
              (notifier.isLeaves)
                  ? SizedBox()
                  : Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:
                              GlobalHelper.getColorSchema(context).onPrimary),
                      child: Text(
                          (notifier.schedule?.isWfa ?? false) ? 'WFA' : 'WFO'))
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              _timeTodayLayout(context, 'Datang',
                  notifier.attendanceToday?.startTime ?? '-'),
              _timeTodayLayout(
                  context, 'Pulang', notifier.attendanceToday?.endTime ?? '-')
            ],
          ),
          SizedBox(
            height: 20,
          ),
          (notifier.isLeaves)
              ? Text(
                  'Anda hari ini sedang cuti',
                  style: GlobalHelper.getTextStyle(context,
                          appTextStyle: AppTextStyle.TITLE_LARGE)
                      ?.copyWith(
                          color: GlobalHelper.getColorSchema(context).onPrimary,
                          fontWeight: FontWeight.bold),
                )
              : Container(
                  width: double.maxFinite,
                  child: FilledButton(
                    onPressed: () => _onPressCreateAttendance(context),
                    child: Text('Buat Kehadiran'),
                    style: FilledButton.styleFrom(
                        backgroundColor:
                            GlobalHelper.getColorSchema(context).onPrimary,
                        foregroundColor:
                            GlobalHelper.getColorSchema(context).primary),
                  ),
                )
        ],
      ),
    );
  }

  _thisMonthLayout(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height - kToolbarHeight),
      width: double.maxFinite,
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          color: GlobalHelper.getColorSchema(context).primaryContainer),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Presensi Sebulan Terakhir',
                  style: GlobalHelper.getTextStyle(context,
                      appTextStyle: AppTextStyle.TITLE_LARGE),
                ),
              ),
              FilledButton(
                  onPressed: () => _onPressSeeAll(context),
                  child: Text('Lihat Semua'))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 1,
            color: GlobalHelper.getColorSchema(context).primary,
          ),
          SizedBox(
            height: 2,
          ),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      'Tgl',
                      style: GlobalHelper.getTextStyle(context,
                          appTextStyle: AppTextStyle.TITLE_SMALL),
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Center(
                      child: Text(
                    'Datang',
                    style: GlobalHelper.getTextStyle(context,
                        appTextStyle: AppTextStyle.TITLE_SMALL),
                  ))),
              Expanded(
                  flex: 2,
                  child: Center(
                      child: Text('Pulang',
                          style: GlobalHelper.getTextStyle(context,
                              appTextStyle: AppTextStyle.TITLE_SMALL))))
            ],
          ),
          SizedBox(
            height: 2,
          ),
          Container(
            height: 2,
            color: GlobalHelper.getColorSchema(context).primary,
          ),
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) => Container(
              margin: EdgeInsets.symmetric(vertical: 2),
              height: 1,
              color: GlobalHelper.getColorSchema(context).surface,
            ),
            itemCount: notifier.listAttendanceThisMonth.length,
            itemBuilder: (context, index) {
              final item = notifier.listAttendanceThisMonth[
                  notifier.listAttendanceThisMonth.length - index - 1];
              return _itemThisMonth(context, item);
            },
          )
        ],
      ),
    );
  }

  _timeTodayLayout(BuildContext context, String label, String time) {
    return Expanded(
        child: Column(
      children: [
        Text(
          time,
          style: GlobalHelper.getTextStyle(context,
                  appTextStyle: AppTextStyle.HEADLINE_MEDIUM)
              ?.copyWith(
                  color: GlobalHelper.getColorSchema(context).onPrimary,
                  fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: GlobalHelper.getTextStyle(context,
                  appTextStyle: AppTextStyle.BODY_MEDIUM)
              ?.copyWith(color: GlobalHelper.getColorSchema(context).onPrimary),
        )
      ],
    ));
  }

  _itemThisMonth(BuildContext context, AttendanceEntity item) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: GlobalHelper.getColorSchema(context).primary),
                  child: Text(
                    DateTimeHelper.formatDateTimeFromString(
                        dateTimeString: item.date!, formar: 'dd\nMMM'),
                    style: GlobalHelper.getTextStyle(context,
                            appTextStyle: AppTextStyle.LABEL_LARGE)
                        ?.copyWith(
                            color:
                                GlobalHelper.getColorSchema(context).onPrimary),
                    textAlign: TextAlign.center,
                  ))),
          Expanded(
              flex: 2,
              child: Center(
                  child: Text(
                item.startTime,
                style: GlobalHelper.getTextStyle(context,
                    appTextStyle: AppTextStyle.BODY_MEDIUM),
              ))),
          Expanded(
              flex: 2,
              child: Center(
                  child: Text(
                item.endTime,
                style: GlobalHelper.getTextStyle(context,
                    appTextStyle: AppTextStyle.BODY_MEDIUM),
              )))
        ],
      ),
    );
  }

  _onPressCreateAttendance(BuildContext context) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FaceRecognitionScreen(),
        ));
    notifier.init();
  }

  _onPressEditNotification(BuildContext context) async {
    DialogHelper.showBottomDialog(
        context: context,
        title: "Edit waktu notifikasi",
        content: DropdownMenu<int>(
            initialSelection: notifier.timeNotification,
            onSelected: (value) => _onSaveEditNotification(context, value!),
            dropdownMenuEntries: notifier.listEditNotification));
  }

  _onPressMenu(BuildContext context) {
    DialogHelper.showBottomDialog(
        context: context,
        title: 'Menu',
        content: Column(
          children: [
            Container(
              width: double.maxFinite,
              child: FilledButton.icon(
                  onPressed: () => _onPressLeave(context),
                  label: Text('Pengajuan cuti'),
                  icon: Icon(Icons.leave_bags_at_home)),
            ),
            Container(
              width: double.maxFinite,
              child: FilledButton.icon(
                  onPressed: () => _onPressEditNotification(context),
                  label: Text('Pengaturan notifikasi'),
                  icon: Icon(Icons.edit_notifications)),
            ),
            Container(
              width: double.maxFinite,
              child: FilledButton.icon(
                  onPressed: () => _onPressPrayerNotification(context),
                  label: Text('Notifikasi sholat'),
                  icon: Icon(Icons.mosque)),
            ),
            Container(
              width: double.maxFinite,
              child: OutlinedButton.icon(
                  onPressed: () => _onPressLogout(context),
                  label: Text('Logout'),
                  icon: Icon(Icons.logout)),
            )
          ],
        ));
  }

  _onPressLogout(BuildContext context) async {
    await SharedPreferencesHelper.logout();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
      (route) => false,
    );
  }

  _onPressSeeAll(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailAttendanceScreen(),
        ));
  }

  _onSaveEditNotification(BuildContext context, int param) {
    Navigator.pop(context);
    notifier.saveNotificationSetting(param);
  }

  _onPressLeave(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LeaveScreen(),
        ));
  }

  _onPressPrayerNotification(BuildContext context) {
    Navigator.pop(context);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PrayerScreen(),
        ));
  }
}

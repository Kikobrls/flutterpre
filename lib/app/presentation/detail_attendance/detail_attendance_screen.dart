import 'package:dewakoding_presensi/app/module/entity/attendance.dart';
import 'package:dewakoding_presensi/app/presentation/detail_attendance/detail_attendance_notifier.dart';
import 'package:dewakoding_presensi/core/helper/date_time_helper.dart';
import 'package:dewakoding_presensi/core/helper/global_helper.dart';
import 'package:dewakoding_presensi/core/widget/app_widget.dart';
import 'package:flutter/material.dart';

class DetailAttendanceScreen
    extends AppWidget<DetailAttendanceNotifier, void, void> {
  @override
  AppBar? appBarBuild(BuildContext context) {
    return AppBar(
      title: Text('Detail Kehadiran'),
    );
  }

  @override
  Widget bodyBuild(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: DropdownMenu<int>(
                  expandedInsets: EdgeInsets.symmetric(horizontal: 1),
                  label: const Text('Bulan'),
                  dropdownMenuEntries: notifier.monthListDropdown,
                  controller: notifier.monthController,
                  initialSelection: 1,
                ),
              ),
              Expanded(
                child: DropdownMenu<int>(
                  expandedInsets: EdgeInsets.symmetric(horizontal: 1),
                  label: const Text('Tahun'),
                  dropdownMenuEntries: notifier.yearListDropdown,
                  controller: notifier.yearController,
                  initialSelection: 2024,
                ),
              ),
              IconButton(onPressed: _onPressSearch, icon: Icon(Icons.search))
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 1,
            color: GlobalHelper.getColorSchema(context).outline,
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
            color: GlobalHelper.getColorSchema(context).outline,
          ),
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) => Container(
              margin: EdgeInsets.symmetric(vertical: 2),
              height: 1,
              color: GlobalHelper.getColorSchema(context).outlineVariant,
            ),
            itemCount: notifier.listAttendance.length,
            itemBuilder: (context, index) {
              final item = notifier
                  .listAttendance[notifier.listAttendance.length - index - 1];
              return _itemThisMonth(context, item);
            },
          )
        ],
      ),
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

  _onPressSearch() {
    notifier.search();
  }
}

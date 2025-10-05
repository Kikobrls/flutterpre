import 'package:dewakoding_presensi/app/module/entity/attendance.dart';
import 'package:dewakoding_presensi/core/network/data_state.dart';

abstract class AttendanceRepository {
  Future<DataState<AttendanceEntity?>> getToday();
  Future<DataState<List<AttendanceEntity>>> getThisMonth();
  Future<DataState> sendAttendance(AttendanceParamEntity param);
  Future<DataState<List<AttendanceEntity>>> getByMonthYear(
      AttendanceParamGetEntity param);
}

import 'package:dewakoding_presensi/app/module/entity/attendance.dart';
import 'package:dewakoding_presensi/app/module/repository/attendance_repository.dart';
import 'package:dewakoding_presensi/core/network/data_state.dart';
import 'package:dewakoding_presensi/core/use_case/app_use_case.dart';

class AttendanceSendUseCase
    extends AppUseCase<Future<DataState>, AttendanceParamEntity> {
  final AttendanceRepository _attendanceRepository;

  AttendanceSendUseCase(this._attendanceRepository);

  @override
  Future<DataState> call({AttendanceParamEntity? param}) {
    return _attendanceRepository.sendAttendance(param!);
  }
}

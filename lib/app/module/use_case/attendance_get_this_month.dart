import 'package:dewakoding_presensi/app/module/entity/attendance.dart';
import 'package:dewakoding_presensi/app/module/repository/attendance_repository.dart';
import 'package:dewakoding_presensi/core/network/data_state.dart';
import 'package:dewakoding_presensi/core/use_case/app_use_case.dart';

class AttendanceGetMonthUseCase
    extends AppUseCase<Future<DataState<List<AttendanceEntity>>>, void> {
  final AttendanceRepository _attendanceRepository;

  AttendanceGetMonthUseCase(this._attendanceRepository);

  @override
  Future<DataState<List<AttendanceEntity>>> call({void param}) {
    return _attendanceRepository.getThisMonth();
  }
}

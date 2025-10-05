import 'package:dewakoding_presensi/app/module/entity/schedule.dart';
import 'package:dewakoding_presensi/app/module/repository/schedule_repository.dart';
import 'package:dewakoding_presensi/core/network/data_state.dart';
import 'package:dewakoding_presensi/core/use_case/app_use_case.dart';

class ScheduleGetUseCase
    extends AppUseCase<Future<DataState<ScheduleEntity?>>, void> {
  final ScheduleRepository _scheduleRepository;

  ScheduleGetUseCase(this._scheduleRepository);

  @override
  Future<DataState<ScheduleEntity?>> call({void param}) {
    return _scheduleRepository.get();
  }
}

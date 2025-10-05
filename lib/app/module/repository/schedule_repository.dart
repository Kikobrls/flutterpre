import 'package:dewakoding_presensi/app/module/entity/schedule.dart';
import 'package:dewakoding_presensi/core/network/data_state.dart';

abstract class ScheduleRepository {
  Future<DataState<ScheduleEntity?>> get();
  Future<DataState> banned();
}

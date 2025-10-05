import 'package:dewakoding_presensi/app/module/entity/leave.dart';
import 'package:dewakoding_presensi/core/network/data_state.dart';

abstract class LeaveRepository {
  Future<DataState> send(LeaveParamEntity param);
}

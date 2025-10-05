import 'package:dewakoding_presensi/app/data/source/leave_api_service.dart';
import 'package:dewakoding_presensi/app/module/entity/leave.dart';
import 'package:dewakoding_presensi/app/module/repository/leave_repository.dart';
import 'package:dewakoding_presensi/core/network/data_state.dart';

class LeaveRepositoryImpl extends LeaveRepository {
  final LeaveApiService _leaveApiService;

  LeaveRepositoryImpl(this._leaveApiService);

  @override
  Future<DataState> send(LeaveParamEntity param) {
    return handleResponse(
      () => _leaveApiService.send(body: param.toJson()),
      (json) => null,
    );
  }
}

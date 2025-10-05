import 'package:dewakoding_presensi/app/module/entity/leave.dart';
import 'package:dewakoding_presensi/app/module/use_case/leave_send.dart';
import 'package:dewakoding_presensi/core/provider/app_provider.dart';
import 'package:flutter/material.dart';

class LeaveNotifier extends AppProvider {
  final LeaveSendUseCase _leaveSendUseCase;
  LeaveNotifier(this._leaveSendUseCase) {
    init();
  }

  bool _isSuccess = false;
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();
  TextEditingController _reasonController = TextEditingController();

  bool get isSuccess => _isSuccess;
  TextEditingController get startDateController => _startDateController;
  TextEditingController get endDateController => _endDateController;
  TextEditingController get reasonController => _reasonController;

  @override
  void init() {
    // TODO: implement init
  }

  send() async {
    showLoading();
    final param = LeaveParamEntity(
        startDate: _startDateController.text,
        endDate: _endDateController.text,
        reason: _reasonController.text);
    final response = await _leaveSendUseCase(param: param);
    if (response.success) {
      _isSuccess = true;
    } else {
      snackbarMessage = response.message;
    }
    hideLoading();
  }
}

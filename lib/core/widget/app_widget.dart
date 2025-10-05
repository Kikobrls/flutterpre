import 'package:dewakoding_presensi/core/di/dependency.dart';
import 'package:dewakoding_presensi/core/helper/dialog_helper.dart';
import 'package:dewakoding_presensi/core/provider/app_provider.dart';
import 'package:dewakoding_presensi/core/widget/error_app_widget.dart';
import 'package:dewakoding_presensi/core/widget/loading_app_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class AppWidget<T extends AppProvider, P1, P2>
    extends StatelessWidget {
  AppWidget({super.key, this.param1, this.param2});

  late T notifier;
  
  final P1? param1;
  final P2? param2;
  
  FilledButton? _alternatifErrorButton;
  FilledButton? get alternatifErrorButton => _alternatifErrorButton;
  set alternatifErrorButton(FilledButton? value) => _alternatifErrorButton = value;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => sl(param1: param1, param2: param2),
      builder: (context, child) => _build(context),
    );
  }

  Widget _build(BuildContext context) {
    notifier = Provider.of<T>(context);
    checkVariableBeforeUi(context);

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        if (notifier.snackbarMessage.isNotEmpty) {
          DialogHelper.showSnackbar(
              context: context, text: notifier.snackbarMessage);
          notifier.snackbarMessage = '';
        }

        checkVariableAfterUi(context);
      },
    );

    return Scaffold(
      appBar: appBarBuild(context),
      body: (notifier.isLoading)
          ? const LoadingAppWidget()
          : (notifier.errorMessage.isNotEmpty)
              ? ErrorAppWidget(
                  description: notifier.errorMessage,
                  onPressDefaultButton: () {
                    notifier.init();
                    notifier.errorMeesage = '';
                  },
                  alternatifButton: alternatifErrorButton,
                )
              : bodyBuild(context),
    );
  }

  void checkVariableBeforeUi(BuildContext context) {}
  void checkVariableAfterUi(BuildContext context) {}
  AppBar? appBarBuild(BuildContext context) => null;
  Widget bodyBuild(BuildContext context);
}

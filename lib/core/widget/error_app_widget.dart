import 'package:dewakoding_presensi/app/presentation/login/login_screen.dart';
import 'package:dewakoding_presensi/core/helper/global_helper.dart';
import 'package:dewakoding_presensi/core/helper/shared_preferences_helper.dart';
import 'package:flutter/material.dart';

class ErrorAppWidget extends StatelessWidget {
  final String description;
  final void Function() onPressDefaultButton;
  final FilledButton? alternatifButton;
  const ErrorAppWidget(
      {super.key,
      required this.description,
      required this.onPressDefaultButton,
      this.alternatifButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            size: 100,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            description,
            style: GlobalHelper.getTextStyle(context,
                appTextStyle: AppTextStyle.HEADLINE_SMALL),
          ),
          SizedBox(
            height: 30,
          ),
          alternatifButton ??
              ((description.contains('401') ||
                      description.toLowerCase().contains('unauthenticated'))
                  ? FilledButton(
                      onPressed: () async {
                        await SharedPreferencesHelper.logout();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                          (route) => false,
                        );
                      },
                      child: Text('Logout'))
                  : FilledButton.icon(
                      onPressed: onPressDefaultButton,
                      icon: Icon(Icons.refresh),
                      label: Text("Refresh")))
        ],
      ),
    );
  }
}

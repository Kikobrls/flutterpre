import 'package:dewakoding_presensi/core/helper/global_helper.dart';
import 'package:flutter/material.dart';

class DialogHelper {
  static showSnackbar({required BuildContext context, required String text}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  static showBottomDialog(
      {required BuildContext context,
      required String title,
      required Widget content}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) {
        return SafeArea(
            child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: GlobalHelper.getTextStyle(context,
                        appTextStyle: AppTextStyle.TITLE_MEDIUM),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              content
            ],
          ),
        ));
      },
    );
  }
}

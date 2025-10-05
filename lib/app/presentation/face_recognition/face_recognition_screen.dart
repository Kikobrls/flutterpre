import 'package:dewakoding_presensi/app/presentation/face_recognition/face_recognition_notifier.dart';
import 'package:dewakoding_presensi/app/presentation/map/map_screen.dart';
import 'package:dewakoding_presensi/core/helper/global_helper.dart';
import 'package:dewakoding_presensi/core/widget/app_widget.dart';
import 'package:flutter/material.dart';

class FaceRecognitionScreen
    extends AppWidget<FaceRecognitionNotifier, void, void> {
  @override
  void checkVariableAfterUi(BuildContext context) {
    if (notifier.percentMatch >= 70) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MapScreen(),
          ));
    }
  }

  @override
  AppBar? appBarBuild(BuildContext context) {
    return AppBar(
      title: Text('Validasi Wajah'),
    );
  }

  @override
  Widget bodyBuild(BuildContext context) {
    return SafeArea(
        child: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          (notifier.currentImage != null)
              ? Image(
                  height: 150,
                  width: 150,
                  image: notifier.currentImage!.image,
                )
              : Icon(
                  Icons.no_photography,
                  size: 75,
                ),
          SizedBox(
            height: 50,
          ),
          (notifier.currentImage == null)
              ? Text(
                  'Gagal mengambil foto',
                  style: GlobalHelper.getTextStyle(context,
                      appTextStyle: AppTextStyle.HEADLINE_MEDIUM),
                )
              : (notifier.percentMatch < 0.0)
                  ? Text(
                      'Sistem mendeteksi wajah anda tidak memiliki hak untuk buat kehadiran',
                      style: GlobalHelper.getTextStyle(context,
                          appTextStyle: AppTextStyle.HEADLINE_SMALL),
                      textAlign: TextAlign.center,
                    )
                  : Text(
                      'Tingkat kemiripan : ${notifier.percentMatch}%',
                      style: GlobalHelper.getTextStyle(context,
                          appTextStyle: AppTextStyle.HEADLINE_MEDIUM),
                      textAlign: TextAlign.center,
                    ),
          SizedBox(
            height: 25,
          ),
          FilledButton(
              onPressed: _onPressOpenCamera, child: Text('Buka Kamera'))
        ],
      ),
    ));
  }

  _onPressOpenCamera() {
    notifier.getCurrentPhoto();
  }
}

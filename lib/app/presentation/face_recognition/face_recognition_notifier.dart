import 'dart:typed_data';

import 'package:dewakoding_presensi/app/module/use_case/photo_get_bytes.dart';
import 'package:dewakoding_presensi/core/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_face_api/flutter_face_api.dart';

class FaceRecognitionNotifier extends AppProvider {
  final PhotoGetBytesUseCase _photoGetBytesUseCase;

  FaceRecognitionNotifier(this._photoGetBytesUseCase) {
    init();
  }

  FaceSDK _faceSDK = FaceSDK.instance;
  MatchFacesImage? mfImage1;
  MatchFacesImage? mfImage2;
  Image? _currentImage;
  double _percentMatch = 0.0;

  Image? get currentImage => _currentImage;
  double get percentMatch => _percentMatch;

  @override
  void init() async {
    await _faceSDK.initialize(config: null);
    await _getBasePhoto();
    if (errorMessage.isEmpty) getCurrentPhoto();
  }

  _getBasePhoto() async {
    showLoading();
    final response = await _photoGetBytesUseCase();
    if (response.success) {
      _setImage(response.data!, ImageType.PRINTED, 1);
    } else {
      errorMeesage = response.message;
    }
    hideLoading();
  }

  _setImage(Uint8List bytes, ImageType type, int flag) {
    final mdImage = MatchFacesImage(bytes, type);
    if (flag == 1) {
      mfImage1 = mdImage;
    } else {
      mfImage2 = mdImage;
      _currentImage = Image.memory(bytes);
    }
  }

  getCurrentPhoto() async {
    _currentImage = null;
    final response = await _faceSDK.startFaceCapture();
    final image = response.image;
    if (image != null) {
      _setImage(image.image, image.imageType, 2);
    }
    if (_currentImage != null) {
      _matchFaces();
    } else {
      notifyListeners();
    }
  }

  _matchFaces() async {
    showLoading();
    _percentMatch = 0.0;
    final request = MatchFacesRequest([mfImage1!, mfImage2!]);
    final response = await _faceSDK.matchFaces(request);
    final split = await _faceSDK.splitComparedFaces(response.results, 0.75);
    final match = split.matchedFaces;
    if (match.isNotEmpty) {
      _percentMatch = match[0].similarity * 100;
    } else {
      _percentMatch = -1;
    }
    hideLoading();
  }
}

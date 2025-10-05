import 'package:dewakoding_presensi/core/network/data_state.dart';

abstract class PhotoRepository {
  Future<DataState<String>> get();
  Future<DataState<dynamic>> getBytes(String url);
}

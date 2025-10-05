import 'package:dewakoding_presensi/core/constant/constant.dart';
import 'package:dewakoding_presensi/core/network/data_state.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'photo_api_service.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class PhotoApiService {
  factory PhotoApiService(Dio dio) {
    return _PhotoApiService(dio);
  }

  @GET('/api/get-photo')
  Future<HttpResponse<DataState>> get();

  @GET('{path}')
  @DioResponseType(ResponseType.bytes)
  Future<HttpResponse<List<int>>> getBytes(
      {@Path('path') required String path});
}

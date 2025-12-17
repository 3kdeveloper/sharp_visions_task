import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:sharpvisions_task/app/models/demo_model/request/user_body/user_body.dart';

part 'network_api_client.g.dart';

@RestApi()
abstract class NetworkApiClient {
  factory NetworkApiClient(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _NetworkApiClient;

  ///! Auth
  @POST('/user/login')
  Future<HttpResponse> login(@Body(nullToAbsent: true) UserBody user);
}

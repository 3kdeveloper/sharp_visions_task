import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:sharpvisions_task/app/models/request/user_body/user_body.dart';
import 'package:sharpvisions_task/app/models/response/main_response_model/main_response_model.dart';

part 'network_api_client.g.dart';

@RestApi()
abstract class NetworkApiClient {
  factory NetworkApiClient(Dio dio, {String? baseUrl}) = _NetworkApiClient;

  @POST('/user/login')
  Future<HttpResponse<MainResponse>> login(
    @Body(nullToAbsent: true) UserBody user,
  );

  @GET('/pos/pos-main')
  Future<HttpResponse<MainResponse>> fetchCategories();

  @GET('/pos/products_by_category')
  Future<HttpResponse<MainResponse>> fetchProducts(@Query('page') int page);
}

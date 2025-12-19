import 'package:dio/dio.dart';
import 'package:sharpvisions_task/app/services/interceptors/request_interceptor.dart';
import 'package:sharpvisions_task/app/services/remote/network_api_client.dart';
import 'package:sharpvisions_task/core/services/secure_storage_service.dart';

import '../constants/exports.dart';

Future<void> initDependencies() async {
  ///! Router
  locator.registerLazySingleton<AppRouter>(() => AppRouter());

  ///! Utils
  locator.registerLazySingleton<BottomSheetUtils>(() => BottomSheetUtils());
  locator.registerLazySingleton<DialogueUtils>(() => DialogueUtils());
  locator.registerLazySingleton<Utils>(() => Utils());

  locator.registerLazySingleton<FlutterSecureStorage>(
    () => FlutterSecureStorage(aOptions: AndroidOptions()),
  );
  locator.registerLazySingleton<SecureStorageService>(
    () => SecureStorageService(),
  );

  locator.registerLazySingleton<Dio>(() => setupDio());
  locator.registerLazySingleton<NetworkApiClient>(
    () => NetworkApiClient(locator<Dio>()),
  );
}

Dio setupDio() {
  Dio dio = Dio(BaseOptions(baseUrl: ConstantsResource.baseUrl));
  if (kDebugMode) {
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }
  dio.interceptors.add(RequestInterceptor());
  return dio;
}

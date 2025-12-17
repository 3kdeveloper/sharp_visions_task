import 'package:dio/dio.dart';
import 'package:sharpvisions_task/app/services/remote/network_api_client.dart';

import '../constants/exports.dart';

Future<void> initDependencies() async {
  ///! Router
  locator.registerLazySingleton<AppRouter>(() => AppRouter());

  ///! Utils
  locator.registerLazySingleton<BottomSheetUtils>(() => BottomSheetUtils());
  locator.registerLazySingleton<DialogueUtils>(() => DialogueUtils());
  locator.registerLazySingleton<Utils>(() => Utils());

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
  return dio;
}

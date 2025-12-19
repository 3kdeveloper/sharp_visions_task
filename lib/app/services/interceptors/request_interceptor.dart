import 'package:dio/dio.dart';
import 'package:sharpvisions_task/core/constants/common_keys.dart';
import 'package:sharpvisions_task/core/services/secure_storage_service.dart';

import '../../../core/constants/exports.dart';

class RequestInterceptor extends Interceptor {
  @override
  Future<void> onRequest(options, handler) async {
    final token = await locator<SecureStorageService>().read(CommonKeys.token);

    options.headers['Authorization'] = 'Bearer $token';
    super.onRequest(options, handler);
  }
}

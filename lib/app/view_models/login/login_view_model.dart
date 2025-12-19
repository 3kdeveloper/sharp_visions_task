import 'package:sharpvisions_task/app/models/request/user_body/user_body.dart';
import 'package:sharpvisions_task/app/services/remote/network_api_client.dart';
import 'package:sharpvisions_task/core/constants/common_keys.dart';
import 'package:sharpvisions_task/core/services/secure_storage_service.dart';

import '../../../core/constants/exports.dart';

class LoginViewModel extends ChangeNotifier {
  final _client = locator<NetworkApiClient>();

  bool _isLoading = false;
  bool _obscurePassword = true;

  bool get isLoading => _isLoading;
  bool get obscurePassword => _obscurePassword;

  void _toggleLoading() {
    _isLoading = !_isLoading;

    notifyListeners();
  }

  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  Future<bool> login(UserBody user) async {
    bool isSuccuss = false;
    try {
      _toggleLoading();
      await _client.login(user).then((response) async {
        if (response.data.success == true) {
          if (response.data.data?.data?.token != null) {
            await locator<SecureStorageService>().write(
              CommonKeys.token,
              response.data.data?.data?.token ?? '',
            );
          }
          isSuccuss = response.data.success ?? false;
        }
      });
    } catch (e) {
      logger.e(e.toString());
    }
    _toggleLoading();
    return isSuccuss;
  }
}

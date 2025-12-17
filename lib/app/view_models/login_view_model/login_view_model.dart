import 'package:sharpvisions_task/app/models/demo_model/request/user_body/user_body.dart';
import 'package:sharpvisions_task/app/services/remote/network_api_client.dart';

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

  Future<void> login(UserBody user) async {
    try {
      _toggleLoading();

      await _client.login(user);
    } catch (e) {
      logger.e(e.toString());
    }
    _toggleLoading();
  }
}

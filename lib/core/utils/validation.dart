import '../constants/exports.dart';

class Validation {
  Validation._();

  /// This method is responsible for handling
  /// Email Validation
  /// e.g: [Validation.validateEmail('email')]
  static String? validateEmail(BuildContext context, String? email) {
    if (email?.isEmpty ?? true) {
      return 'Please enter your email';
    } else if (!(email?.isValidEmail ?? true)) {
      return 'Please enter a valid email address';
    } else {
      return null;
    }
  }

  /// This method is responsible for handling
  /// Password Validation
  /// e.g: [Validation.validatePassword('password')]
  static String? validatePassword(BuildContext context, String? password) {
    if (password == null || password.isEmpty) {
      return 'Please enter your password';
    } else if (password.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }
}

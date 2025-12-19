import '../constants/exports.dart';

extension ContextExt on BuildContext {
  void unFocusKeyboard() {
    if (_isKeyboardVisible()) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  bool _isKeyboardVisible() => FocusScope.of(this).hasFocus;

  bool validateForm(GlobalKey<FormState> formKey) =>
      formKey.currentState?.validate() ?? false;
}

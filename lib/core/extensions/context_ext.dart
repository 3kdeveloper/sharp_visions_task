import '../constants/exports.dart';

extension ContextExt on BuildContext {
  void unFocusKeyboard() {
    if (_isKeyboardVisible()) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  bool _isKeyboardVisible() => FocusScope.of(this).hasFocus;

  void requestFocus(FocusNode focusNode) =>
      FocusScope.of(this).requestFocus(focusNode);

  double get bottomPadding => MediaQuery.of(this).viewInsets.bottom;
}

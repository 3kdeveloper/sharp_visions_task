import '../../core/constants/exports.dart';

class AppTheme {
  static ThemeData lightThemeData = ThemeData(
    fontFamily: ConstantsResource.fontFamily,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.scaffoldBgColor,
    primaryColor: AppColors.primaryColor,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.primaryColor,
      selectionColor: AppColors.primaryColor.withValues(alpha: 0.4),
      selectionHandleColor: AppColors.primaryColor,
    ),
    textTheme: textTheme,
  );
}

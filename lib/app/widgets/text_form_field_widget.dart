import '../../core/constants/exports.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.controller,
    this.focusNode,
    this.style,
    this.autofillHints,
    this.onTap,
    this.hintText,
    this.labelText,
    this.errorText,
    this.keyboardType,
    this.textInputAction,
    this.obscureText,
    this.enabled,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.suffixIcon,
    this.radius,
    this.borderWidth,
    this.autovalidateMode,
    this.maxLines,
    this.errorStyle,
    this.border,
    this.contentPadding,
    this.textAlign,
    this.onChanged,
    this.validator,
    this.onFieldSubmitted,
    this.onEditingComplete,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final TextStyle? style;
  final Iterable<String>? autofillHints;
  final VoidCallback? onTap;
  final String? hintText, labelText, errorText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool? obscureText;
  final bool? enabled;
  final Widget? prefixIcon;
  final BoxConstraints? prefixIconConstraints;
  final Widget? suffixIcon;
  final AutovalidateMode? autovalidateMode;
  final double? radius;
  final double? borderWidth;
  final int? maxLines;
  final TextStyle? errorStyle;
  final InputBorder? border;
  final EdgeInsetsGeometry? contentPadding;
  final TextAlign? textAlign;
  final Function(String? value)? onChanged;
  final String? Function(String? value)? validator;
  final Function(String)? onFieldSubmitted;
  final Function()? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      controller: controller,
      contextMenuBuilder:
          (BuildContext context, EditableTextState editableTextState) {
            // If supported, show the system context menu.
            if (SystemContextMenu.isSupported(context)) {
              return SystemContextMenu.editableText(
                editableTextState: editableTextState,
              );
            }
            // Otherwise, show the flutter-rendered context menu for the current platform.
            return AdaptiveTextSelectionToolbar.editableText(
              editableTextState: editableTextState,
            );
          },
      focusNode: focusNode,
      autofillHints: autofillHints,
      textInputAction: textInputAction ?? TextInputAction.done,
      autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,
      enabled: enabled,
      keyboardType: keyboardType ?? TextInputType.text,
      obscureText: obscureText ?? false,
      maxLines: maxLines ?? 1,
      style:
          style ??
          textTheme.labelMedium?.copyWith(
            color: AppColors.blackColor,
            fontWeight: FontWeight.w500,
          ),
      textAlignVertical: TextAlignVertical.center,
      textAlign: textAlign ?? TextAlign.start,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        hintText: hintText ?? '',
        hintStyle: textTheme.labelMedium?.copyWith(
          color: AppColors.blackColor.withValues(alpha: 0.5),
          fontWeight: FontWeight.w500,
        ),
        labelText: labelText,
        labelStyle: textTheme.bodyMedium?.copyWith(
          color: AppColors.blackColor,
          fontWeight: FontWeight.w500,
        ),
        alignLabelWithHint: true,
        errorText: errorText,
        errorStyle:
            errorStyle ??
            textTheme.labelSmall?.copyWith(color: AppColors.redColor),
        prefixIcon: prefixIcon,
        prefixIconConstraints: prefixIconConstraints,
        suffixIcon: suffixIcon,
        fillColor: AppColors.whiteColor,
        filled: true,
        errorMaxLines: 3,
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        border:
            border ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 8),
              borderSide: BorderSide(
                width: borderWidth ?? 2,
                color: AppColors.primaryColor,
              ),
            ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 8),
          borderSide: BorderSide(
            width: borderWidth ?? 2,
            color: AppColors.primaryColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 8),
          borderSide: BorderSide(
            width: borderWidth ?? 2,
            color: AppColors.redColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 8),
          borderSide: BorderSide(
            width: borderWidth ?? 2,
            color: AppColors.primaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 8),
          borderSide: BorderSide(
            width: borderWidth ?? 2,
            color: AppColors.borderColor,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 8),
          borderSide: BorderSide(
            width: borderWidth ?? 2,
            color: AppColors.borderColor,
          ),
        ),
      ),
      onChanged: onChanged,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      onEditingComplete: onEditingComplete,
    );
  }
}

import 'package:flutter/cupertino.dart';

import '../../core/constants/exports.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.btnText,
    required this.onTap,
    this.icon,
    this.child,
    this.width,
    this.color,
    this.textColor,
    this.borderColor,
    this.fontWeight,
    this.style,
    this.isShowBorder = false,
    this.radius,
    this.margin,
    this.padding,
    this.isShowLoading = false,
    this.borderWidth,
  });

  final String btnText;
  final String? icon;
  final Widget? child;
  final VoidCallback onTap;
  final double? width;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final FontWeight? fontWeight;
  final TextStyle? style;
  final bool isShowBorder;
  final double? radius;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final bool isShowLoading;
  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.maxFinite,
      alignment: Alignment.center,
      margin: margin,
      padding: padding ?? EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).primaryColor,
        border: isShowBorder
            ? Border.all(
                width: borderWidth ?? 0.5,
                color: borderColor ?? AppColors.primaryColor,
              )
            : null,
        borderRadius: BorderRadius.circular(radius ?? 8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isShowLoading)
            Row(
              children: [
                CupertinoActivityIndicator(
                  color: textColor ?? AppColors.whiteColor,
                  radius: 10,
                ),
                SizedBox(width: 6),
                TextViewWidget(
                  'Please Wait...',
                  style:
                      style ??
                      textTheme.labelLarge?.copyWith(
                        color: textColor ?? AppColors.whiteColor,
                        fontWeight: fontWeight ?? FontWeight.w600,
                      ),
                ),
              ],
            ),
          if (!isShowLoading)
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) SvgPictureAssetWidget(icon!, size: 28),
                  if (icon != null) SizedBox(width: 8),
                  Flexible(
                    child:
                        child ??
                        TextViewWidget(
                          btnText,
                          isEllipsis: true,
                          maxLines: 1,
                          style:
                              style ??
                              textTheme.labelLarge?.copyWith(
                                color: textColor ?? AppColors.whiteColor,
                                fontWeight: fontWeight ?? FontWeight.w600,
                              ),
                        ),
                  ),
                ],
              ),
            ),
        ],
      ),
    ).onTap(!isShowLoading ? onTap : () {}).applyShimmer(height: 40.0);
  }
}

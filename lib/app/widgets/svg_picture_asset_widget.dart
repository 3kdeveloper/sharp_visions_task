import '../../core/constants/exports.dart';

class SvgPictureAssetWidget extends StatelessWidget {
  const SvgPictureAssetWidget(
    this.assetName, {
    super.key,
    this.fit,
    this.color,
    this.isApplyColorFilter = false,
    this.size,
    this.width,
    this.height,
  });

  final String assetName;
  final BoxFit? fit;
  final Color? color;
  final bool isApplyColorFilter;
  final double? size, width, height;

  @override
  Widget build(BuildContext context) => SvgPicture.asset(
        assetName,
        width: size ?? width,
        height: size ?? height,
        fit: fit ?? BoxFit.scaleDown,
        colorFilter: isApplyColorFilter
            ? ColorFilter.mode(color ?? AppColors.whiteColor, BlendMode.srcIn)
            : null,
      );
}

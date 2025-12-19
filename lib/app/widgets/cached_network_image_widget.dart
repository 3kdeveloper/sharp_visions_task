import 'package:fast_cached_network_image/fast_cached_network_image.dart';

import '../../core/constants/exports.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  const CachedNetworkImageWidget({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.size,
    this.cacheWidth,
    this.cacheHeight,
    this.cacheSize,
    this.borderRadius,
    this.errorWidget,
  });

  final String? imageUrl;
  final BoxFit fit;
  final double? width;
  final double? height;
  final double? size;
  final int? cacheWidth;
  final int? cacheHeight;
  final int? cacheSize;
  final BorderRadiusGeometry? borderRadius;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) =>
      ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(8),
        child: imageUrl != null
            ? FastCachedImage(
                url: imageUrl!,
                width: size ?? width ?? double.maxFinite,
                height: size ?? height,
                cacheWidth: cacheSize ?? cacheWidth,
                cacheHeight: cacheSize ?? cacheHeight,
                fit: fit,
                fadeInDuration: const Duration(milliseconds: 100),
                loadingBuilder: (context, url) => Skeletonizer(
                  enabled: true,
                  child: Container(
                    width: size ?? width ?? double.maxFinite,
                    height: size ?? height,
                    color: Colors.white,
                  ),
                ),
                errorBuilder: (context, url, error) => DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.redColor),
                    borderRadius: borderRadius,
                  ),
                  child: Center(
                    child:
                        errorWidget ??
                        const Icon(
                          Icons.error_outline,
                          color: AppColors.redColor,
                        ),
                  ),
                ),
              )
            : Image.asset(
                ImagesResource.placeHolderImg,
                width: size ?? width ?? double.maxFinite,
                height: size ?? height,
                fit: BoxFit.cover,
              ),
      ).applyShimmer(
        width: size ?? width ?? double.maxFinite,
        height: size ?? height,
      );
}

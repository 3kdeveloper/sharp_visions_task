import 'package:sharpvisions_task/app/models/response/data_model/data_model.dart';
import 'package:sharpvisions_task/app/widgets/cached_network_image_widget.dart';

import '../../../../core/constants/exports.dart';

class ProductCardWidget extends StatelessWidget {
  final DataModel item;

  const ProductCardWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: .start,
        mainAxisAlignment: .spaceBetween,
        children: [
          AspectRatio(
            aspectRatio: 1 / .8,
            child: Stack(
              children: [
                CachedNetworkImageWidget(imageUrl: item.itemImage),

                if ((item.salePrice ?? 0.0) > 0.0)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'Sale',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                TextViewWidget(
                  item.productName ?? '',
                  maxLines: 1,
                  isEllipsis: true,
                  style: textTheme.labelMedium,
                ),
                SizedBox(height: 8),
                TextViewWidget(
                  item.salesDescription ?? '',
                  style: textTheme.labelSmall?.copyWith(
                    color: AppColors.blackColor.withValues(alpha: 0.6),
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: TextViewWidget(
                        (((item.salePrice ?? 0.0) > 0.0
                                    ? item.salePrice
                                    : item.costPrice) ??
                                0.0)
                            .toString(),
                        maxLines: 1,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xFF00A693),
                        ),
                      ),
                    ),
                    Container(
                      width: 24,
                      height: 24,
                      decoration: const BoxDecoration(
                        color: Color(0xFF00A693),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

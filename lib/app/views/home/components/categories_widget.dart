import 'package:sharpvisions_task/app/view_models/home/home_view_model.dart';
import 'package:sharpvisions_task/app/widgets/cached_network_image_widget.dart';

import '../../../../core/constants/exports.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Consumer<HomeViewModel>(
        builder: (context, controller, _) {
          return ListView.builder(
            scrollDirection: .horizontal,
            padding: const .symmetric(horizontal: 16),
            itemCount: controller.categories.length,
            itemBuilder: (context, index) {
              final category = controller.categories[index];
              return Container(
                margin: const .only(right: 8),
                padding: const .symmetric(horizontal: 8, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: .all(color: AppColors.borderColor),
                  borderRadius: .circular(6),
                ),
                child: Row(
                  spacing: 12,
                  children: [
                    CachedNetworkImageWidget(
                      imageUrl: category.catImageLink,
                      size: 24,
                    ),
                    TextViewWidget(
                      category.catLabel ?? '',
                      style: textTheme.labelMedium?.copyWith(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

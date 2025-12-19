import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:sharpvisions_task/app/models/response/data_model/data_model.dart';
import 'package:sharpvisions_task/app/view_models/home/home_view_model.dart';
import 'package:sharpvisions_task/app/widgets/cached_network_image_widget.dart';
import 'package:sharpvisions_task/core/constants/exports.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final PagingController<int, DataModel> _pagingController;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => context.read<HomeViewModel>().fetchCategories(),
    );
    _pagingController = PagingController(firstPageKey: 0);
    _pagingController.addPageRequestListener(
      (pageKey) => WidgetsBinding.instance.addPostFrameCallback(
        (_) => context.read<HomeViewModel>().fetchProducts(
          pagingController: _pagingController,
          page: pageKey,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          spacing: 8,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                spacing: 8,
                children: [
                  Expanded(
                    child: TextFormFieldWidget(
                      controller: TextEditingController(),
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search products...',
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 44,
                    decoration: BoxDecoration(
                      color: const Color(0xFF00A693),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
              child: Consumer<HomeViewModel>(
                builder: (context, controller, _) {
                  return ListView.builder(
                    scrollDirection: .horizontal,
                    padding: const .symmetric(horizontal: 16),
                    itemCount: controller.categories.length,
                    itemBuilder: (context, index) {
                      final category = controller.categories[index].catLabel;
                      return Container(
                        margin: const .only(right: 8),
                        padding: const .symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: .all(color: AppColors.borderColor),
                          borderRadius: .circular(6),
                        ),
                        child: Row(
                          spacing: 4,
                          children: [
                            // if (index != 0)
                            //   Icon(
                            //     Icons.local_pizza_outlined,
                            //     color: isSelected
                            //         ? Colors.white
                            //         : Colors.grey[600],
                            //   ),
                            TextViewWidget(
                              category ?? '',
                              style: textTheme.labelMedium?.copyWith(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      );

                      // Padding(
                      //   padding: const EdgeInsets.only(right: 8),
                      //   child: FilterChip(
                      //     label: Text(
                      //       category,
                      // style: TextStyle(
                      //   color: isSelected ? Colors.white : Colors.grey[600],
                      //   fontWeight: FontWeight.w500,
                      // ),
                      //     ),
                      //     selected: isSelected,
                      //     onSelected: (selected) {
                      //       setState(() {
                      //         _selectedCategory = category;
                      //       });
                      //     },
                      //     backgroundColor: Colors.grey[100],
                      //     selectedColor: const Color(0xFF00A693),
                      //     checkmarkColor: Colors.white,
                      //     padding: const EdgeInsets.symmetric(
                      //       horizontal: 16,
                      //       vertical: 8,
                      //     ),
                      //   ),
                      // );
                    },
                  );
                },
              ),
            ),

            Expanded(
              child: PagedGridView<int, DataModel>(
                pagingController: _pagingController,
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                builderDelegate: PagedChildBuilderDelegate<DataModel>(
                  itemBuilder: (context, item, index) =>
                      FoodCardWidget(item: item),
                  firstPageProgressIndicatorBuilder: (_) => const Center(
                    child: CircularProgressIndicator(color: Color(0xFF00A693)),
                  ),
                  newPageProgressIndicatorBuilder: (_) => const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: CircularProgressIndicator(
                        color: Color(0xFF00A693),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FoodCardWidget extends StatelessWidget {
  final DataModel item;

  const FoodCardWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1 / .7,
            child: Stack(
              children: [
                CachedNetworkImageWidget(imageUrl: item.itemImage),

                // if (item.isOnSale)
                //   Positioned(
                //     top: 8,
                //     right: 8,
                //     child: Container(
                //       padding: const EdgeInsets.symmetric(
                //         horizontal: 8,
                //         vertical: 4,
                //       ),
                //       decoration: BoxDecoration(
                //         color: Colors.red,
                //         borderRadius: BorderRadius.circular(4),
                //       ),
                //       child: const Text(
                //         'Sale',
                //         style: TextStyle(
                //           color: Colors.white,
                //           fontSize: 12,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //     ),
                //   ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                FittedBox(
                  child: TextViewWidget(
                    item.productName ?? '',
                    maxLines: 2,
                    isEllipsis: true,
                    style: textTheme.labelMedium,
                  ),
                ),
                SizedBox(height: 8),
                TextViewWidget(
                  'Sub title',
                  style: textTheme.labelSmall?.copyWith(
                    color: AppColors.blackColor.withValues(alpha: 0.6),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      (item.salePrice ?? 0.0).toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFF00A693),
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

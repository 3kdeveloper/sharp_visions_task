import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:sharpvisions_task/app/models/response/data_model/data_model.dart';
import 'package:sharpvisions_task/app/view_models/home/home_view_model.dart';
import 'package:sharpvisions_task/app/views/home/components/categories_widget.dart';
import 'package:sharpvisions_task/app/views/home/components/product_card_widget.dart';
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
    _pagingController = PagingController(firstPageKey: 1);
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
            CategoriesWidget(),
            Expanded(
              child: PagedGridView<int, DataModel>(
                pagingController: _pagingController,
                padding: const EdgeInsets.all(16),
                showNewPageErrorIndicatorAsGridChild: false,
                showNewPageProgressIndicatorAsGridChild: false,
                showNoMoreItemsIndicatorAsGridChild: false,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                builderDelegate: PagedChildBuilderDelegate<DataModel>(
                  itemBuilder: (context, item, index) =>
                      ProductCardWidget(item: item),
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
                  noMoreItemsIndicatorBuilder: (context) => Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: TextViewWidget('No more data.'),
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

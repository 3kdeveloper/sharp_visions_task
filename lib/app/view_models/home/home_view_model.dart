import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:sharpvisions_task/app/models/response/category_model/category_model.dart';
import 'package:sharpvisions_task/app/models/response/data_model/data_model.dart';
import 'package:sharpvisions_task/app/services/remote/network_api_client.dart';

import '../../../core/constants/exports.dart';

class HomeViewModel extends ChangeNotifier {
  final _client = locator<NetworkApiClient>();

  bool _isLoading = false;
  List<CategoryModel> categories = [];

  bool get isLoading => _isLoading;

  void _toggleLoading() {
    _isLoading = !_isLoading;

    notifyListeners();
  }

  Future<void> fetchCategories() async {
    try {
      await _client.fetchCategories().then((response) {
        categories = response.data.data?.data?.productCategories ?? [];
      });
    } catch (e) {
      logger.e(e.toString());
    }
    notifyListeners();
  }

  Future<bool> fetchProducts({
    required PagingController pagingController,
    required int page,
  }) async {
    bool isSuccuss = false;
    try {
      _toggleLoading();
      await _client.fetchProducts(page).then((response) {
        final dataList = response.data.data?.dataList;
        if (dataList != null) {
          final products = dataList
              .map((item) => DataModel.fromJson(item))
              .toList();

          final isLastPage = products.length < ConstantsResource.pageSize;

          if (isLastPage) {
            pagingController.appendLastPage(products);
          } else {
            final nextPageKey = page += 1;
            pagingController.appendPage(products, nextPageKey);
          }
        }
      });
    } catch (e) {
      logger.e(e.toString());
    }
    _toggleLoading();
    return isSuccuss;
  }
}

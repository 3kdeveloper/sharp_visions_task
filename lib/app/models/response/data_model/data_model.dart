import 'package:sharpvisions_task/app/models/response/category_model/category_model.dart';

import '../../../../core/constants/exports.dart';

part 'data_model.g.dart';

@JsonSerializable()
class DataModel {
  DataModel({
    this.token,
    this.itemImage,
    this.productName,
    this.salesDescription,
    this.costPrice,
    this.salePrice,
  });

  final String? token;

  @JsonKey(name: 'product_categories')
  List<CategoryModel>? productCategories;

  @JsonKey(name: 'item_image')
  final String? itemImage;

  @JsonKey(name: 'p_name')
  final String? productName;

  @JsonKey(name: 'sales_description')
  final String? salesDescription;

  @JsonKey(name: 'cost_price')
  final double? costPrice;

  @JsonKey(name: 'sale_price')
  final double? salePrice;

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}

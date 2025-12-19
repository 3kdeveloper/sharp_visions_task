// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataModel _$DataModelFromJson(Map<String, dynamic> json) =>
    DataModel(
        token: json['token'] as String?,
        itemImage: json['item_image'] as String?,
        productName: json['p_name'] as String?,
        salesDescription: json['sales_description'] as String?,
        costPrice: (json['cost_price'] as num?)?.toDouble(),
        salePrice: (json['sale_price'] as num?)?.toDouble(),
      )
      ..productCategories = (json['product_categories'] as List<dynamic>?)
          ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
  'token': instance.token,
  'product_categories': instance.productCategories,
  'item_image': instance.itemImage,
  'p_name': instance.productName,
  'sales_description': instance.salesDescription,
  'cost_price': instance.costPrice,
  'sale_price': instance.salePrice,
};

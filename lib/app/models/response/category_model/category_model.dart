import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  CategoryModel({
    this.catId,
    this.catLabel,
    this.catLabelAr,
    this.catImageLink,
    this.isDefault,
    this.branchId,
  });

  @JsonKey(name: 'cat_id')
  int? catId;
  @JsonKey(name: 'cat_label')
  String? catLabel;
  @JsonKey(name: 'cat_label_ar')
  String? catLabelAr;
  @JsonKey(name: 'cat_image_link')
  String? catImageLink;
  @JsonKey(name: 'is_default')
  bool? isDefault;
  @JsonKey(name: 'branch_id')
  int? branchId;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}

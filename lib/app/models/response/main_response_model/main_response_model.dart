import 'package:sharpvisions_task/app/models/data_converter/response_data_converter.dart';
import 'package:sharpvisions_task/app/models/response/pagination_model/pagination_model.dart';

import '../../../../core/constants/exports.dart';

part 'main_response_model.g.dart';

@JsonSerializable()
class MainResponse {
  MainResponse({
    this.success,
    this.message,
    this.redirect,
    this.token,
    this.data,
    this.pagination,
  });

  bool? success;
  String? message;
  String? redirect;
  String? token;
  @ResponseDataConverter()
  ResponseDataModel? data;
  PaginationModel? pagination;

  factory MainResponse.fromJson(Map<String, dynamic> json) =>
      _$MainResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MainResponseToJson(this);
}

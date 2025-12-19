import 'package:sharpvisions_task/app/models/response/data_model/data_model.dart';

import '../../../core/constants/exports.dart';

class ResponseDataModel {
  final DataModel? data;
  final String? dataString;
  final num? dataNumber;
  final bool? dataBool;
  final List<dynamic>? dataList;

  const ResponseDataModel({
    this.data,
    this.dataString,
    this.dataNumber,
    this.dataBool,
    this.dataList,
  });
}

///! Universal JSON converter to handle multiple types: object, string, number (int/double), bool, list
class ResponseDataConverter
    implements JsonConverter<ResponseDataModel?, dynamic> {
  const ResponseDataConverter();

  @override
  ResponseDataModel? fromJson(dynamic json) {
    if (json == null) return null;

    if (json is Map<String, dynamic>) {
      return ResponseDataModel(data: DataModel.fromJson(json));
    } else if (json is String) {
      return ResponseDataModel(dataString: json);
    } else if (json is int || json is double) {
      return ResponseDataModel(dataNumber: json);
    } else if (json is bool) {
      return ResponseDataModel(dataBool: json);
    } else if (json is List) {
      return ResponseDataModel(dataList: json);
    }

    throw Exception('Unexpected data format: ${json.runtimeType}');
  }

  @override
  dynamic toJson(ResponseDataModel? data) {
    if (data == null) return null;

    if (data.data != null) {
      return data.data?.toJson();
    } else if (data.dataString != null) {
      return data.dataString;
    } else if (data.dataNumber != null) {
      return data.dataNumber;
    } else if (data.dataBool != null) {
      return data.dataBool;
    } else if (data.dataList != null) {
      return data.dataList;
    }

    logger.e('Warning: ResponseDataModel has no data set for serialization.');
    return null;
  }
}

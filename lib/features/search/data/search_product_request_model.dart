import 'dart:convert';

import '/core/api/core_models/base_result_model.dart';

SearchProductRequestModel searchProductRequestModelFromJson(String str) =>
    SearchProductRequestModel.fromJson(json.decode(str));

String searchProductRequestModelToJson(SearchProductRequestModel data) =>
    json.encode(data.toJson());

class SearchProductRequestModel extends BaseResultModel {
  String? text;

  SearchProductRequestModel({
    this.text,
  });

  factory SearchProductRequestModel.fromJson(Map<String, dynamic> json) =>
      SearchProductRequestModel(
        text: json["text"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "text": text,
      };
}

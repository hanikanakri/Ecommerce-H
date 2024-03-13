
import '/core/api/core_models/base_result_model.dart';

class AddFavoritesRequestModel extends BaseResultModel{
  int? productId;

  AddFavoritesRequestModel({
    this.productId,
  });

  factory AddFavoritesRequestModel.fromJson(Map<String, dynamic> json) => AddFavoritesRequestModel(
    productId: json["product_id"],
  );

  @override
  Map<String, dynamic> toJson() => {
    "product_id": productId,
  };
}

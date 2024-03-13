import '/core/api/core_models/base_result_model.dart';

class AddFavoritesRespondModel extends BaseResultModel {
  int? id;
  Product? product;

  AddFavoritesRespondModel({
    this.id,
    this.product,
  });

  factory AddFavoritesRespondModel.fromJson(Map<String, dynamic> json) =>
      AddFavoritesRespondModel(
        id: json["id"],
        product:
            json["product"] == null ? null : Product.fromJson(json["product"]),
      );

  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "product": product?.toJson(),
      };
}

class Product {
  int? id;
  int? price;
  int? oldPrice;
  int? discount;
  String? imageUrl;

  Product({
    this.id,
    this.price,
    this.oldPrice,
    this.discount,
    this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        price: json["price"],
        oldPrice: json["old_price"],
        discount: json["discount"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "old_price": oldPrice,
        "discount": discount,
        "image_url": imageUrl,
      };
}

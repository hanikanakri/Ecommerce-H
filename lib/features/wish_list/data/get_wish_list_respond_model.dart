import '/core/api/core_models/base_result_model.dart';

class GetFavoritesRespondModel extends ListResultModel<GetFavoriteModel> {
  int? currentPage;
  @override
  List<GetFavoriteModel>? list;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  GetFavoritesRespondModel({
    this.currentPage,
    this.list,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory GetFavoritesRespondModel.fromJson(Map<String, dynamic> json) =>
      GetFavoritesRespondModel(
        currentPage: json["current_page"],
        list: json["data"] == null
            ? []
            : List<GetFavoriteModel>.from(json["data"]!.map((x) => GetFavoriteModel.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": list == null
            ? []
            : List<dynamic>.from(list!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class GetFavoriteModel {
  int? id;
  Product? product;

  GetFavoriteModel({
    this.id,
    this.product,
  });

  factory GetFavoriteModel.fromJson(Map<String, dynamic> json) => GetFavoriteModel(
        id: json["id"],
        product:
            json["product"] == null ? null : Product.fromJson(json["product"]),
      );

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
  String? image;
  String? name;
  String? description;

  Product({
    this.id,
    this.price,
    this.oldPrice,
    this.discount,
    this.image,
    this.name,
    this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        price: json["price"],
        oldPrice: json["old_price"],
        discount: json["discount"],
        image: json["image"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "old_price": oldPrice,
        "discount": discount,
        "image": image,
        "name": name,
        "description": description,
      };
}

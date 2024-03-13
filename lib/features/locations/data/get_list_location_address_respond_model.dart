import '/core/api/core_models/base_result_model.dart';

class GetListLocationAddressRespondModel extends ListResultModel<LocationListDetails>{
  int? currentPage;
  @override
  List<LocationListDetails>? list;
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

  GetListLocationAddressRespondModel({
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

  factory GetListLocationAddressRespondModel.fromJson(Map<String, dynamic> json) => GetListLocationAddressRespondModel(
    currentPage: json["current_page"],
    list: json["data"] == null ? [] : List<LocationListDetails>.from(json["data"]!.map((x) => LocationListDetails.fromJson(x))),
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
    "data": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
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

class LocationListDetails {
  int? id;
  String? name;
  String? city;
  String? region;
  String? details;
  String? notes;
  double? latitude;
  double? longitude;

  LocationListDetails({
    this.id,
    this.name,
    this.city,
    this.region,
    this.details,
    this.notes,
    this.latitude,
    this.longitude,
  });

  factory LocationListDetails.fromJson(Map<String, dynamic> json) => LocationListDetails(
    id: json["id"],
    name: json["name"],
    city: json["city"],
    region: json["region"],
    details: json["details"],
    notes: json["notes"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "city": city,
    "region": region,
    "details": details,
    "notes": notes,
    "latitude": latitude,
    "longitude": longitude,
  };
}

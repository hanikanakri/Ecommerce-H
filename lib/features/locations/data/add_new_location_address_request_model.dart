import '/core/api/core_models/base_result_model.dart';

class AddNewLocationAddressRequestModel extends BaseResultModel {
  String? name;
  String? city;
  String? region;
  String? details;
  double? latitude;
  double? longitude;
  String? notes;

  AddNewLocationAddressRequestModel({
    this.name,
    this.city,
    this.region,
    this.details,
    this.latitude,
    this.longitude,
    this.notes,
  });

  factory AddNewLocationAddressRequestModel.fromJson(
          Map<String, dynamic> json) =>
      AddNewLocationAddressRequestModel(
        name: json["name"],
        city: json["city"],
        region: json["region"],
        details: json["details"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        notes: json["notes"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "name": name,
        "city": city,
        "region": region,
        "details": details,
        "latitude": latitude,
        "longitude": longitude,
        "notes": notes,
      };
}

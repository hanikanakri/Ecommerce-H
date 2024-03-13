
import '/core/api/core_models/base_result_model.dart';

class EditProfileRespondModel extends BaseResultModel{
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;

  EditProfileRespondModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.points,
    this.credit,
  });

  factory EditProfileRespondModel.fromJson(Map<String, dynamic> json) => EditProfileRespondModel(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    image: json["image"],
    points: json["points"],
    credit: json["credit"],
  );

  @override
  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "image": image,
    "points": points,
    "credit": credit,
  };
}

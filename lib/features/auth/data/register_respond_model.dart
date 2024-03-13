
import '/core/api/core_models/base_result_model.dart';

class RegisterRespondModel extends BaseResultModel{
  String? name;
  String? phone;
  String? email;
  int? id;
  String? image;
  String? token;

  RegisterRespondModel({
    this.name,
    this.phone,
    this.email,
    this.id,
    this.image,
    this.token,
  });

  factory RegisterRespondModel.fromJson(Map<String, dynamic> json) => RegisterRespondModel(
    name: json["name"],
    phone: json["phone"],
    email: json["email"],
    id: json["id"],
    image: json["image"],
    token: json["token"],
  );

  @override
  Map<String, dynamic> toJson() => {
    "name": name,
    "phone": phone,
    "email": email,
    "id": id,
    "image": image,
    "token": token,
  };
}

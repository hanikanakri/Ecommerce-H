
import '/core/api/core_models/base_result_model.dart';

class RegisterRequestModel extends BaseResultModel{
  String? name;
  String? phone;
  String? email;
  String? password;
  String? image;

  RegisterRequestModel({
    this.name,
    this.phone,
    this.email,
    this.password,
    this.image,
  });

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) => RegisterRequestModel(
    name: json["name"],
    phone: json["phone"],
    email: json["email"],
    password: json["password"],
    image: json["image"],
  );

  @override
  Map<String, dynamic> toJson() => {
    "name": name,
    "phone": phone,
    "email": email,
    "password": password,
    "image": image,
  };
}

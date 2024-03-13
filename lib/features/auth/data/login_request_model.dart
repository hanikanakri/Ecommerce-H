
import '/core/api/core_models/base_result_model.dart';

class LoginRequestModel extends BaseResultModel{
  String? email;
  String? password;

  LoginRequestModel({
    this.email,
    this.password,
  });

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) => LoginRequestModel(
    email: json["email"],
    password: json["password"],
  );

  @override
  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
  };
}

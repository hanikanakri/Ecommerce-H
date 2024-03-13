
import '/core/api/core_models/base_result_model.dart';

class EditPasswordRequestModel extends BaseResultModel{
  String? currentPassword;
  String? newPassword;

  EditPasswordRequestModel({
    this.currentPassword,
    this.newPassword,
  });

  factory EditPasswordRequestModel.fromJson(Map<String, dynamic> json) => EditPasswordRequestModel(
    currentPassword: json["current_password"],
    newPassword: json["new_password"],
  );

  @override
  Map<String, dynamic> toJson() => {
    "current_password": currentPassword,
    "new_password": newPassword,
  };
}

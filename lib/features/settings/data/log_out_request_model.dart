
import '/core/api/core_models/base_result_model.dart';

class LogOutRequestModel extends BaseResultModel{
  String? fcmToken;

  LogOutRequestModel({
    this.fcmToken,
  });

  factory LogOutRequestModel.fromJson(Map<String, dynamic> json) => LogOutRequestModel(
    fcmToken: json["fcm_token"],
  );

  @override
  Map<String, dynamic> toJson() => {
    "fcm_token": fcmToken,
  };
}

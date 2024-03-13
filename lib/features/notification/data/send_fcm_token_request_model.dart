
import '/core/api/core_models/base_result_model.dart';

class SendFcmTokenRequestModel extends BaseResultModel{
  String? token;

  SendFcmTokenRequestModel({
    this.token,
  });

  factory SendFcmTokenRequestModel.fromJson(Map<String, dynamic> json) => SendFcmTokenRequestModel(
    token: json["token"],
  );

  @override
  Map<String, dynamic> toJson() => {
    "token": token,
  };
}

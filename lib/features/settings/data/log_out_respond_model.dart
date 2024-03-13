
import '/core/api/core_models/base_result_model.dart';

class LogOutRespondModel extends BaseResultModel{
  int? id;
  String? token;

  LogOutRespondModel({
    this.id,
    this.token,
  });

  factory LogOutRespondModel.fromJson(Map<String, dynamic> json) => LogOutRespondModel(
    id: json["id"],
    token: json["token"],
  );

  @override
  Map<String, dynamic> toJson() => {
    "id": id,
    "token": token,
  };
}

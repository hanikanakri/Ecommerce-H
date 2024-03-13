
import '/core/api/core_models/base_result_model.dart';

class GetSettingsDataRespondModel extends BaseResultModel{
  String? about;
  String? terms;

  GetSettingsDataRespondModel({
    this.about,
    this.terms,
  });

  factory GetSettingsDataRespondModel.fromJson(Map<String, dynamic> json) => GetSettingsDataRespondModel(
    about: json["about"],
    terms: json["terms"],
  );

  @override
  Map<String, dynamic> toJson() => {
    "about": about,
    "terms": terms,
  };
}

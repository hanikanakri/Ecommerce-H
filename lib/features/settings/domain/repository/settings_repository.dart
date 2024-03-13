import '/features/settings/data/get_settings_data_respond_model.dart';

import '/core/api/core_models/base_result_model.dart';
import '/core/api/data_source/remote_data_source.dart';
import '/core/api/http/api_urls.dart';
import '/core/api/http/http_method.dart';
import '/features/settings/data/log_out_request_model.dart';
import '/features/settings/data/log_out_respond_model.dart';

class SettingsRepository {
  static Future<BaseResultModel> logOut(LogOutRequestModel data) async {
    var res = await RemoteDataSource.request<LogOutRespondModel>(
      converter: (json) => LogOutRespondModel.fromJson(json),
      method: HttpMethod.post,
      url: ApiURLs.logOut,
      withAuthentication: true,
      data: data.toJson(),
    );
    return res;
  }

  static Future<BaseResultModel> getSettings() async {
    var res = await RemoteDataSource.request<GetSettingsDataRespondModel>(
      converter: (json) => GetSettingsDataRespondModel.fromJson(json),
      method: HttpMethod.get,
      url: ApiURLs.settings,
      withAuthentication: false,
    );
    return res;
  }
}

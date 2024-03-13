import '/core/api/core_models/base_result_model.dart';
import '/core/api/data_source/remote_data_source.dart';
import '/core/api/http/api_urls.dart';
import '/core/api/http/http_method.dart';
import '/features/auth/data/get_profile_info_respond_model.dart';
import '/features/auth/data/login_request_model.dart';
import '/features/auth/data/login_respond_model.dart';
import '/features/auth/data/register_request_model.dart';
import '/features/auth/data/register_respond_model.dart';

class AuthRepository {
  static Future<BaseResultModel> login(LoginRequestModel data) async {
    var res = await RemoteDataSource.request<LoginRespondModel>(
      converter: (json) => LoginRespondModel.fromJson(json),
      method: HttpMethod.post,
      withAuthentication: false,
      data: data.toJson(),
      url: ApiURLs.login,
    );
    return res;
  }

  static Future<BaseResultModel> register(RegisterRequestModel data) async {
    var res = await RemoteDataSource.request<RegisterRespondModel>(
      converter: (json) => RegisterRespondModel.fromJson(json),
      method: HttpMethod.post,
      withAuthentication: false,
      data: data.toJson(),
      url: ApiURLs.register,
      isLongTime: true,
    );
    return res;
  }

  static Future<BaseResultModel> profileInfo() async {
    var res = await RemoteDataSource.request<GetProfileInfoRespondModel>(
      converter: (json) => GetProfileInfoRespondModel.fromJson(json),
      method: HttpMethod.get,
      withAuthentication: true,
      url: ApiURLs.profile,
    );
    return res;
  }
}

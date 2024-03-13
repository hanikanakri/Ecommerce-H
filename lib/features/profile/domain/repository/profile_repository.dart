import '/core/api/core_models/base_result_model.dart';
import '/core/api/core_models/empty_model.dart';
import '/core/api/data_source/remote_data_source.dart';
import '/core/api/http/api_urls.dart';
import '/core/api/http/http_method.dart';
import '/features/profile/data/edit_password_request_model.dart';
import '/features/profile/data/edit_profile_request_model.dart';
import '/features/profile/data/edit_profile_respond_model.dart';

class ProfileRepository {
  static Future<BaseResultModel> updateProfile(
      EditProfileRequestModel data) async {
    var res = await RemoteDataSource.request<EditProfileRespondModel>(
      converter: (json) => EditProfileRespondModel.fromJson(json),
      method: HttpMethod.put,
      url: ApiURLs.editProfile,
      data: data.toJson(),
      withAuthentication: true,
      isLongTime: true,
    );
    return res;
  }

  static Future<BaseResultModel> editPassword(
      EditPasswordRequestModel data) async {
    var res = await RemoteDataSource.request<EmptyModel>(
      converter: (json) => EmptyModel.fromJson(json),
      method: HttpMethod.post,
      url: ApiURLs.editPassword,
      withAuthentication: true,
      data: data.toJson(),
    );
    return res;
  }


}

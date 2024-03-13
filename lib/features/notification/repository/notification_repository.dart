import '/core/api/core_models/base_result_model.dart';
import '/core/api/core_models/empty_model.dart';
import '/core/api/data_source/remote_data_source.dart';
import '/core/api/http/api_urls.dart';
import '/core/api/http/http_method.dart';

class NotificationRepository {
  static Future<BaseResultModel> uploadNotificationsToken(
      String? token) async {
    var res = await RemoteDataSource.request<EmptyModel>(
      converter: (json) => EmptyModel.fromJson(json),
      method: HttpMethod.post,
      withAuthentication: true,
      queryParameters: {"token": token},
      url: ApiURLs.tokenFCM,
    );
    return res;
  }
}

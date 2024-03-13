import '/core/api/core_models/base_result_model.dart';
import '/core/api/data_source/remote_data_source.dart';
import '/core/api/http/api_urls.dart';
import '/core/api/http/http_method.dart';
import '/features/wish_list/data/get_wish_list_respond_model.dart';

class WishListRepository {
  static Future<BaseResultModel> getFavorites() async {
    var res = await RemoteDataSource.request<GetFavoritesRespondModel>(
      converter: (json) => GetFavoritesRespondModel.fromJson(json),
      method: HttpMethod.get,
      withAuthentication: true,
      url: ApiURLs.favorites,
    );
    return res;
  }
}

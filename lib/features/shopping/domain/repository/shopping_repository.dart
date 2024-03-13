import '/core/api/core_models/base_result_model.dart';
import '/core/api/data_source/remote_data_source.dart';
import '/core/api/http/api_urls.dart';
import '/core/api/http/http_method.dart';
import '/features/locations/data/add_favorites_request_model.dart';
import '/features/shopping/data/add_favorites_respond_model.dart';
import '/features/shopping/data/get_shopping_data_respond_model.dart';

class ShoppingRepository {
  static Future<BaseResultModel> shoppingList() async {
    var res = await RemoteDataSource.request<GetShoppingDataRespondModel>(
      converter: (json) => GetShoppingDataRespondModel.fromJson(json),
      method: HttpMethod.get,
      withAuthentication: true,
      url: ApiURLs.shoppingList,
    );
    return res;
  }

  static Future<BaseResultModel> addFavorites(
      AddFavoritesRequestModel data) async {
    var res = await RemoteDataSource.request<AddFavoritesRespondModel>(
      converter: (json) => AddFavoritesRespondModel.fromJson(json),
      method: HttpMethod.post,
      withAuthentication: true,
      url: ApiURLs.favorites,
      data: data.toJson(),
    );
    return res;
  }
}

import '/core/api/core_models/base_result_model.dart';
import '/core/api/data_source/remote_data_source.dart';
import '/core/api/http/api_urls.dart';
import '/core/api/http/http_method.dart';
import '/features/categories/data/get_all_categories_respond_model.dart';
import '/features/categories/data/get_categories_details_respond_model.dart';

class CategoriesRepository {
  static Future<BaseResultModel> getAllCategories() async {
    var res = await RemoteDataSource.request<GetAllCategoriesRespondModel>(
      converter: (json) => GetAllCategoriesRespondModel.fromJson(json),
      method: HttpMethod.get,
      withAuthentication: true,
      url: ApiURLs.getAllCategories,
    );
    return res;
  }

  static Future<BaseResultModel> getCategoriesDetails(int id) async {
    var res = await RemoteDataSource.request<GetCategoriesDetailsRespondModel>(
      converter: (json) => GetCategoriesDetailsRespondModel.fromJson(json),
      method: HttpMethod.get,
      withAuthentication: true,
      url: "${ApiURLs.getAllCategories}/$id",
    );
    return res;
  }
}

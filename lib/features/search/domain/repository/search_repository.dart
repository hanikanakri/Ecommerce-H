
import '/core/api/core_models/base_result_model.dart';
import '/core/api/data_source/remote_data_source.dart';
import '/core/api/http/api_urls.dart';
import '/core/api/http/http_method.dart';
import '/features/search/data/search_product_request_model.dart';
import '/features/search/data/search_product_respond_model.dart';

class SearchRepository {
  static Future<BaseResultModel> searchProduct(
      SearchProductRequestModel data) async {
    var res = await RemoteDataSource.request<SearchProductRespondModel>(
      converter: (json) => SearchProductRespondModel.fromJson(json),
      method: HttpMethod.post,
      url: ApiURLs.searchProduct,
      withAuthentication: true,
      data: data.toJson(),
    );
    return res;
  }
}

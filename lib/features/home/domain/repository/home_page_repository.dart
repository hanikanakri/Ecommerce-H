import '/core/api/core_models/base_result_model.dart';
import '/core/api/data_source/remote_data_source.dart';
import '/core/api/http/api_urls.dart';
import '/core/api/http/http_method.dart';
import '/features/home/data/home_page_respond_model.dart';


class HomePageRepository {
  static Future<BaseResultModel> homePageData() async {
    var res = await RemoteDataSource.request<HomePageRespondModel>(
      converter: (json) => HomePageRespondModel.fromJson(json),
      method: HttpMethod.get,
      url: ApiURLs.homePageData,
      withAuthentication: true,
    );
    return res;
  }

}

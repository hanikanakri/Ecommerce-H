import '/core/api/core_models/base_result_model.dart';
import '/core/api/data_source/remote_data_source.dart';
import '/core/api/http/api_urls.dart';
import '/core/api/http/http_method.dart';
import '/features/locations/data/add_branch_location_address_request_model.dart';
import '/features/locations/data/add_new_location_address_request_model.dart';
import '/features/locations/data/delete_address_respond_model.dart';
import '/features/locations/data/get_list_location_address_respond_model.dart';

class LocationRepository {
  static Future<BaseResultModel> getListLocationAddresses() async {
    var res =
        await RemoteDataSource.request<GetListLocationAddressRespondModel>(
      converter: (json) => GetListLocationAddressRespondModel.fromJson(json),
      method: HttpMethod.get,
      withAuthentication: true,
      url: ApiURLs.getLocationAddresses,
    );
    return res;
  }

  static Future<BaseResultModel> addNewLocationAddress(
      AddNewLocationAddressRequestModel data) async {
    var res =
        await RemoteDataSource.request<GetListLocationAddressRespondModel>(
      converter: (json) => GetListLocationAddressRespondModel.fromJson(json),
      method: HttpMethod.post,
      withAuthentication: true,
      data: data.toJson(),
      url: ApiURLs.getLocationAddresses,
    );
    return res;
  }

  static Future<BaseResultModel> deleteLocationAddress(int index) async {
    var res = await RemoteDataSource.request<DeleteAddressRespondModel>(
      converter: (json) => DeleteAddressRespondModel.fromJson(json),
      method: HttpMethod.delete,
      withAuthentication: true,
      url: "${ApiURLs.deleteLocationAddresses}$index",
    );
    return res;
  }

  static Future<BaseResultModel> addBranchLocationAddress(
      AddBranchLocationAddressRequestModel data) async {
    var res = await RemoteDataSource.request<DeleteAddressRespondModel>(
      converter: (json) => DeleteAddressRespondModel.fromJson(json),
      method: HttpMethod.post,
      withAuthentication: true,
      data: data.toJson(),
      url: ApiURLs.getLocationAddresses,
    );
    return res;
  }


  static Future<BaseResultModel> editBranchLocationAddress(
      AddBranchLocationAddressRequestModel data,int index) async {
    var res = await RemoteDataSource.request<DeleteAddressRespondModel>(
      converter: (json) => DeleteAddressRespondModel.fromJson(json),
      method: HttpMethod.put,
      withAuthentication: true,
      data: data.toJson(),
      url: "${ApiURLs.deleteLocationAddresses}$index",
    );
    return res;
  }
}

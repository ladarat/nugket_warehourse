import 'package:fish_nugket_warehourse/app/core/base/base_remote_source.dart';
import 'package:fish_nugket_warehourse/app/data/model/location_request.dart';
import 'package:fish_nugket_warehourse/app/data/model/warehouse_response.dart';
import 'package:fish_nugket_warehourse/app/data/remote/nugget_remote_data_source.dart';
import 'package:fish_nugket_warehourse/app/network/dio_provider.dart';

class NuggetRemoteDataSourceImpl extends BaseRemoteSource
    implements NuggetRemoteDataSource {
  @override
  Future<WarehouseResponse>? searchNuggetNearBy(
      LocationRequest locationRequest) {
    var endpoint = "${DioProvider.baseUrl}/v2/warehouses";
    var dioCall = dioClient.post(endpoint, data: locationRequest.toJson());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => WarehouseResponse.fromJson(response.data));
    } catch (e) {
      print('searchNuggetNearBy ==> $e');
      rethrow;
    }
  }
}

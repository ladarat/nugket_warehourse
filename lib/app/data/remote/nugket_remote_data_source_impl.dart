import 'package:fish_nugket_warehourse/app/core/base/base_remote_source.dart';
import 'package:fish_nugket_warehourse/app/data/model/location_request.dart';
import 'package:fish_nugket_warehourse/app/data/model/warehouse_response.dart';
import 'package:fish_nugket_warehourse/app/data/remote/nugket_remote_data_source.dart';
import 'package:fish_nugket_warehourse/app/network/dio_provider.dart';

class NugketRemoteDataSourceImpl extends BaseRemoteSource 
implements NugketRemoteDataSource {

  @override
  Future<WarehouseResponse> searchNugketNearBy(LocationRequest locationRequest) {

    var endpoint = "${DioProvider.baseUrl}/v2/warehouses";
    var dioCall = dioClient.post(endpoint, data: locationRequest.toJson());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => WarehouseResponse.fromJson(response.data));
    } catch (e) {
      print('searchNugketNearBy ==> $e');
      rethrow;
    }

  }
}
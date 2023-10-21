import 'package:fish_nugket_warehourse/app/data/model/location_request.dart';
import 'package:fish_nugket_warehourse/app/data/model/warehouse_response.dart';

abstract class NugketRemoteDataSource {
  Future<WarehouseResponse> searchNugketNearBy(LocationRequest locationRequest);
}
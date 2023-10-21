import 'package:fish_nugket_warehourse/app/data/model/location.dart';
import 'package:fish_nugket_warehourse/app/data/model/warehouse_response.dart';

abstract class NugketRepository {
  Future<WarehouseResponse> searchNugketNearBy(LocationRequest locationRequest);
}
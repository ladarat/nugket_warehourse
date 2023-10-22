import 'package:fish_nugket_warehourse/app/data/model/location_request.dart';
import 'package:fish_nugket_warehourse/app/data/model/warehouse_response.dart';

abstract class NuggetRepository {
  Future<WarehouseResponse>? searchNuggetNearBy(
      LocationRequest locationRequest);
}

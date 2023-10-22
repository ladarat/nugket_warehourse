import 'package:fish_nugket_warehourse/app/data/model/location_request.dart';
import 'package:fish_nugket_warehourse/app/data/model/models.dart';
import 'package:fish_nugket_warehourse/app/data/remote/nugget_remote_data_source.dart';
import 'package:fish_nugket_warehourse/app/data/repository/nugget_repository.dart';
import 'package:get/get.dart';

class NugketRepositoryImpl implements NuggetRepository {
  final NuggetRemoteDataSource _remoteSource =
      Get.find(tag: (NuggetRemoteDataSource).toString());

  @override
  Future<WarehouseResponse>? searchNuggetNearBy(
      LocationRequest locationRequest) {
    return _remoteSource.searchNuggetNearBy(locationRequest);
  }
}

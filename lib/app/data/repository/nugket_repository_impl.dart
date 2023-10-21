import 'package:fish_nugket_warehourse/app/data/model/location_request.dart';
import 'package:fish_nugket_warehourse/app/data/model/models.dart';
import 'package:fish_nugket_warehourse/app/data/remote/nugket_remote_data_source.dart';
import 'package:fish_nugket_warehourse/app/data/repository/nugket_repository.dart';
import 'package:get/get.dart';

class NugketRepositoryImpl implements NugketRepository {
  final NugketRemoteDataSource _remoteSource =
      Get.find(tag: (NugketRemoteDataSource).toString());

  @override
  Future<WarehouseResponse> searchNugketNearBy(
      LocationRequest locationRequest) {
    return _remoteSource.searchNugketNearBy(locationRequest);
  }
}

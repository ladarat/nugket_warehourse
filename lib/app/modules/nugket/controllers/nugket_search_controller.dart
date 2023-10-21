import 'package:fish_nugket_warehourse/app/data/model/location_request.dart';
import 'package:fish_nugket_warehourse/app/data/model/warehouse_response.dart';
import 'package:fish_nugket_warehourse/app/data/repository/nugket_repository.dart';
import 'package:fish_nugket_warehourse/app/modules/nugket/models/nugket_detail_ui_data.dart';
import 'package:get/get.dart';

class NugketSearchController extends GetxController {
  NugketRepository _nugketRepository =
      Get.find(tag: (NugketRepository).toString());

  final nugketDetails = <NugketDetailUiData>[].obs;

  Future<List<NugketDetailUiData>> searchNugket(
      LocationRequest locationRequest) async {
    final result = await _nugketRepository.searchNugketNearBy(locationRequest);

    return convertToNugketDetailUiData(result);
  }

  List<NugketDetailUiData> convertToNugketDetailUiData(
      WarehouseResponse response) {
    for (var store in response.data.warehouses.warehouseStores) {
      nugketDetails.add(
        NugketDetailUiData(
          closeTime: store.closeTime,
          distance: store.distance,
          openTime: store.openTime,
          warehouseNameEn: store.warehouseNameEn,
          warehouseNameTh: store.warehouseNameTh,
        ),
      );
    }
    return nugketDetails;
  }
}

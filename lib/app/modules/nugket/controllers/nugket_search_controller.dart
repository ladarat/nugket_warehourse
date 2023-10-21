import 'package:fish_nugket_warehourse/app/data/model/location_request.dart';
import 'package:fish_nugket_warehourse/app/data/model/warehouse_response.dart';
import 'package:fish_nugket_warehourse/app/data/repository/nugket_repository.dart';
import 'package:fish_nugket_warehourse/app/modules/nugket/models/nugket_detail_ui_data.dart';
import 'package:get/get.dart';

class NugketSearchController extends GetxController {
  NugketRepository _nugketRepository =
      Get.find(tag: (NugketRepository).toString());

  final nugketDetails = <NugketDetailUiData>[].obs;

  void searchNugket(LocationRequest locationRequest) async {
    final result = await _nugketRepository.searchNugketNearBy(locationRequest);
    convertToNugketDetailUiData(result);
  }

  void convertToNugketDetailUiData(WarehouseResponse response) {
    final _nugketDetails = <NugketDetailUiData>[];
    for (var store in response.data.warehouses.warehouseStores) {
      _nugketDetails.add(
        NugketDetailUiData(
          closeTime: store.closeTime,
          distance: store.distance,
          openTime: store.openTime,
          warehouseNameEn: store.warehouseNameEn,
          warehouseNameTh: store.warehouseNameTh,
        ),
      );
    }

    nugketDetails.addAll(_nugketDetails);
  }
}

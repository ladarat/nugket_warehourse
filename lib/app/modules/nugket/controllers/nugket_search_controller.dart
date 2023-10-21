import 'package:fish_nugket_warehourse/app/data/model/location_request.dart';
import 'package:fish_nugket_warehourse/app/data/model/warehouse_response.dart';
import 'package:fish_nugket_warehourse/app/data/repository/nugket_repository.dart';
import 'package:fish_nugket_warehourse/app/modules/nugket/models/nugket_detail_ui_data.dart';
import 'package:fish_nugket_warehourse/app/network/exceptions/app_exception.dart';
import 'package:get/get.dart';

class NugketSearchController extends GetxController {
  NugketRepository _nugketRepository =
      Get.find(tag: (NugketRepository).toString());

  final _isLoading = true.obs;
  final List<NugketDetailUiData> _nugketDetails = <NugketDetailUiData>[].obs;
  bool get isLoading => _isLoading.value;

  List<NugketDetailUiData> get nugketDetails => _nugketDetails;

  Future<void> fetchNugkets(LocationRequest locationRequest) async {
    try {
      _isLoading(true);
      final result =
          await _nugketRepository.searchNugketNearBy(locationRequest);
      print(result);
      convertToNugketDetailUiData(result);
    } on AppException catch (e) {
      print(e.message);
    } finally {
      _isLoading(false);
    }
  }

  void convertToNugketDetailUiData(WarehouseResponse response) {
    final _nugketDetailList = <NugketDetailUiData>[];
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

    _nugketDetails.addAll(_nugketDetailList);
  }
}

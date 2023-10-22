import 'package:fish_nugket_warehourse/app/data/model/location_request.dart';
import 'package:fish_nugket_warehourse/app/data/model/warehouse_store.dart';
import 'package:fish_nugket_warehourse/app/data/repository/nugget_repository.dart';
import 'package:fish_nugket_warehourse/app/modules/nugget/models/nugget_detail_ui_data.dart';
import 'package:fish_nugket_warehourse/app/network/exceptions/app_exception.dart';
import 'package:get/get.dart';

class NuggetSearchController extends GetxController {
  NuggetRepository _nugketRepository =
      Get.find(tag: (NuggetRepository).toString());

  final _isLoading = false.obs;
  final List<NuggetDetailUiData> _nugketDetails = <NuggetDetailUiData>[].obs;

  bool get isLoading => _isLoading.value;

  List<NuggetDetailUiData> get nugketDetails => _nugketDetails;

  set setIsLoading(bool isLoading) => _isLoading(isLoading);

  set setNugketDetails(List<NuggetDetailUiData> nugketDetailUiDataList) =>
      _nugketDetails.addAll(nugketDetailUiDataList);

  Future<void> fetchNugkets(LocationRequest? locationRequest) async {
    if (locationRequest == null) {
      return;
    }
    try {
      _isLoading(true);
      final result =
          await _nugketRepository.searchNuggetNearBy(locationRequest);
      print(result);
      convertToNugketDetailUiData(
          result?.data.warehouses.warehouseStores ?? []);
    } on AppException catch (e) {
      print('AppException ===>${e.message}');
    } finally {
      _isLoading(false);
    }
  }

  void convertToNugketDetailUiData(List<WarehouseStore> stores) {
    final _nugketDetailList = <NuggetDetailUiData>[];

    for (var store in stores) {
      _nugketDetails.add(
        NuggetDetailUiData(
          closeTime: parseAndFormatTime(input: store.closeTime),
          openTime: parseAndFormatTime(input: store.openTime),
          distance: store.distance,
          warehouseNameEn: store.warehouseNameEn,
          warehouseNameTh: store.warehouseNameTh,
        ),
      );
    }
    _nugketDetails.addAll(_nugketDetailList);
  }

  String parseAndFormatTime({String? input}) {
    if (input == null || input.isEmpty) {
      return '';
    }
    // Split the input string into date and time components
    List<String> parts = input.split(' ');

    if (parts.length != 2) {
      return '';
    }

    // Extract the time component
    String timeComponent = parts[1];

    // Split the time component into hours, minutes, and seconds
    List<String> timeParts = timeComponent.split(':');

    if (timeParts.length < 3) {
      return '';
    }

    int hours = int.tryParse(timeParts[0]) ?? 0;
    int minutes = int.tryParse(timeParts[1]) ?? 0;

    String formattedTime =
        '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';

    return formattedTime;
  }
}

import 'package:fish_nugket_warehourse/app/modules/nugket/controllers/nugket_search_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart'; // For mocking dependencies
import 'package:fish_nugket_warehourse/app/data/model/location_request.dart';
import 'package:fish_nugket_warehourse/app/data/model/warehouse_response.dart';
import 'package:fish_nugket_warehourse/app/data/repository/nugket_repository.dart';
import 'package:fish_nugket_warehourse/app/network/exceptions/app_exception.dart';
import 'package:get/get.dart';

import 'mock_data/mock_nugget_search_response.dart';

class MockNugketRepository extends Mock implements NugketRepository {}


void main() {
  group('NugketSearchController Tests', () {
    late NugketSearchController controller;
    late MockNugketRepository mockRepository;

    setUp(() {
      Get.testMode = true; // Enable GetX test mode
      mockRepository = MockNugketRepository();
      Get.put<NugketRepository>(mockRepository,tag: (NugketRepository).toString());
      controller = NugketSearchController();
    });

    tearDown(() {
      Get.reset();
    });

    test('fetchNugkets sets isLoading to true and calls the repository', () async {
      const locationRequest = LocationRequest(
        count: 20,
        latitude: 100,
        longitude: 58.0,
      ); // Provide valid location request

      when(mockRepository.searchNugketNearBy(locationRequest))
          .thenAnswer((_) async => WarehouseResponse.fromJson(dataMock)); // Provide a mock response

      await controller.fetchNugkets(locationRequest);

      // expect(controller.isLoading, true);
      verify(mockRepository.searchNugketNearBy(locationRequest));

      //Finally reset to flase
      expect(controller.isLoading, false);
    });

    test('fetchNugkets handles AppException correctly', () async {
      const locationRequest = LocationRequest(
        count: 20,
        latitude: 100,
        longitude: 58.0,
      ); // Provide valid location request

      when(mockRepository.searchNugketNearBy(locationRequest))
          .thenThrow(AppException(message: 'Test Error')); // Simulate an exception

      await controller.fetchNugkets(locationRequest);

      // expect(controller.isLoading, true);
      verify(mockRepository.searchNugketNearBy(locationRequest));

      //Finally reset to flase
      expect(controller.isLoading, false);
    });

    test('convertToNugketDetailUiData converts WarehouseResponse to NugketDetailUiData', () {
      final response = WarehouseResponse.fromJson(dataMock); // Provide a valid response
      // Add data to response for testing

      controller.convertToNugketDetailUiData(response.data.warehouses.warehouseStores);

      expect(controller.nugketDetails.isNotEmpty, true);
      // Add assertions to verify data conversion
    });
  });
}

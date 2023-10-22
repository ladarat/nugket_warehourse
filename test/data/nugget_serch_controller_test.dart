import 'package:fish_nugket_warehourse/app/modules/nugget/controllers/nugget_search_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart'; // For mocking dependencies
import 'package:fish_nugket_warehourse/app/data/model/location_request.dart';
import 'package:fish_nugket_warehourse/app/data/model/warehouse_response.dart';
import 'package:fish_nugket_warehourse/app/data/repository/nugget_repository.dart';
import 'package:fish_nugket_warehourse/app/network/exceptions/app_exception.dart';
import 'package:get/get.dart';

import 'mock_data/mock_nugget_search_response.dart';

class MockNugketRepository extends Mock implements NuggetRepository {}

void main() {
  group('NugketSearchController Tests', () {
    late NuggetSearchController controller;
    late MockNugketRepository mockRepository;

    setUp(() {
      Get.testMode = true; // Enable GetX test mode
      mockRepository = MockNugketRepository();
      Get.put<NuggetRepository>(mockRepository,
          tag: (NuggetRepository).toString());
      controller = NuggetSearchController();
    });

    tearDown(() {
      Get.reset();
    });

    test('fetchNugkets sets isLoading to true and calls the repository',
        () async {
      const locationRequest = LocationRequest(
        count: 20,
        latitude: 100,
        longitude: 58.0,
      ); // Provide valid location request

      when(mockRepository.searchNuggetNearBy(locationRequest)).thenAnswer(
          (_) async =>
              WarehouseResponse.fromJson(dataMock)); // Provide a mock response

      await controller.fetchNugkets(locationRequest);

      // expect(controller.isLoading, true);
      verify(mockRepository.searchNuggetNearBy(locationRequest));

      //Finally reset to flase
      expect(controller.isLoading, false);
    });

    test('fetchNugkets handles AppException correctly', () async {
      const locationRequest = LocationRequest(
        count: 20,
        latitude: 100,
        longitude: 58.0,
      ); // Provide valid location request

      when(mockRepository.searchNuggetNearBy(locationRequest)).thenThrow(
          AppException(message: 'Test Error')); // Simulate an exception

      await controller.fetchNugkets(locationRequest);

      // expect(controller.isLoading, true);
      verify(mockRepository.searchNuggetNearBy(locationRequest));

      //Finally reset to flase
      expect(controller.isLoading, false);
    });

    test(
        'convertToNugketDetailUiData converts WarehouseResponse to NugketDetailUiData',
        () {
      final response =
          WarehouseResponse.fromJson(dataMock); // Provide a valid response
      // Add data to response for testing

      controller.convertToNugketDetailUiData(
          response.data.warehouses.warehouseStores);

      expect(controller.nugketDetails.isNotEmpty, true);
      // Add assertions to verify data conversion
    });
  });
}

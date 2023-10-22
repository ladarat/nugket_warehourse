import 'package:fish_nugket_warehourse/app/data/repository/nugget_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:fish_nugket_warehourse/app/data/model/location_request.dart';
import 'package:fish_nugket_warehourse/app/data/model/models.dart';
import 'package:fish_nugket_warehourse/app/data/remote/nugget_remote_data_source.dart';
import 'package:get/get.dart';

class MockNugketRemoteDataSource extends Mock
    implements NuggetRemoteDataSource {}

void main() {
  late NugketRepositoryImpl repository;
  late MockNugketRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockNugketRemoteDataSource();
    Get.put<NuggetRemoteDataSource>(mockRemoteDataSource,
        tag: (NuggetRemoteDataSource).toString());

    repository = NugketRepositoryImpl();
  });

  group('searchNugketNearBy', () {
    // Add appropriate parameters here if needed

    test('returns WarehouseResponse', () async {
      final locationRequest = LocationRequest(
        count: 300,
        latitude: 13.715640648070432,
        longitude: 100.58632593601942,
      );

      final expectedResponse = WarehouseResponse.fromJson({
        "code": "success",
        "data": {
          "warehouses": {
            "seller_id": 1,
            "warehouse_stores": [
              {
                "warehouse_address_th": "78 ซอยสุขุมวิท 63",
                "cd1": "Sgm Ekamai,Hyper_ce Ekamai,Hyper_nb Ekamai",
                "cd19": "",
                "open_time": "0000-00-00 01:00:00:000000",
                "distance": 1.28152,
                "warehouse_name_th": "บิ๊กซี เอกมัย",
                "cd13": "",
                "cd14": "",
                "cd17": "",
                "open_weekday": [0, 1, 2, 3, 4, 5, 6],
                "province_en": "Bangkok",
                "warehouse_name_en": "BIGC EKAMAI",
                "sub_district_en": "",
                "cd7": "",
                "cd9": "",
                "cd11": "",
                "warehouse_type_en": "Supercenter",
                "warehouse_type_th": "",
                "longitude": 100.586014,
                "is_available_store": 1,
                "warehouse_address_en": "",
                "sub_district_th": "",
                "cd5": "",
                "cd8": "",
                "cd16": "",
                "express_delivery_range": 3,
                "warehouse_parent_id": 4294967295,
                "district_en": "",
                "close_time": "0000-00-00 15:00:00:000000",
                "warehouse_details_en": "",
                "postal": "10110",
                "province_th": "กรุงเทพมหานคร",
                "cd2": "Sgm Ekamai,Hyper_ce Ekamai,Hyper_nb Ekamai",
                "cd6": "",
                "cd10": "",
                "shipping_methods": [6534, 6536, 6537],
                "latitude": 13.727162,
                "cd3": "02-7148222",
                "cd4": "",
                "cd12": "",
                "cd15": "",
                "cd20": "",
                "district_th": "",
                "warehouse_details_th": "",
                "cd18": "",
                "home_delivery_range": 3,
                "is_nonehub": 0,
                "store_id": 11144
              }
            ]
          },
          "shipping_methods": [
            {
              "shipping_names": [
                {
                  "language": "th",
                  "description": "ส่งด่วน",
                  "description_short": "ส่งด่วน"
                }
              ],
              "icon_enable_image_en_url":
                  "https://st.bigc-cs.com/public/static/shipping_methods/express.png",
              "icon_disable_file_path":
                  "/public/static/shipping_methods/express.png",
              "icon_disable_image_en_url":
                  "https://st.bigc-cs.com/public/static/shipping_methods/express.png",
              "fms_name": "Express",
              "icon_disable_image_url":
                  "https://st.bigc-cs.com/public/static/shipping_methods/express.png",
              "is_active": 1,
              "icon_disable_file_en_path":
                  "/public/static/shipping_methods/express.png",
              "short_name_th": "ส่งด่วน",
              "shipping_id": 6534,
              "display_sequence": 1,
              "shipping_code": "EXPRESS",
              "seller_ids": [1],
              "icon_enable_image_url":
                  "https://st.bigc-cs.com/public/static/shipping_methods/express.png",
              "shipping_type": "D",
              "shipping_name_en": "Express",
              "shipping_name_th": "ส่งด่วน",
              "icon_enable_file_path":
                  "/public/static/shipping_methods/express.png",
              "warehouse_type": "NEAREST",
              "icon_enable_file_en_path":
                  "/public/static/shipping_methods/express.png",
              "short_name_en": "Express",
              "payment_methods": ["COD", "COB", "CCOL"]
            },
          ]
        }
      }); // Add expected response here

      when(mockRemoteDataSource.searchNuggetNearBy(locationRequest)).thenAnswer(
          (_) async => Future<WarehouseResponse>.value(expectedResponse));

      final result = await repository.searchNuggetNearBy(locationRequest);

      expect(result, equals(expectedResponse));
      verify(mockRemoteDataSource.searchNuggetNearBy(locationRequest));
    });
  });
}

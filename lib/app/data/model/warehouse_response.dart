import 'package:fish_nugket_warehourse/app/data/model/data_warehouse.dart';

class WarehouseResponse {
    String code;
    DataWarehouse data;

    WarehouseResponse({
        required this.code,
        required this.data,
    });

    factory WarehouseResponse.fromJson(Map<String, dynamic> json) => WarehouseResponse(
        code: json["code"],
        data: DataWarehouse.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "data": data.toJson(),
    };
}
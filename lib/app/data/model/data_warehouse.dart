import 'package:fish_nugket_warehourse/app/data/model/shipping_method.dart';
import 'package:fish_nugket_warehourse/app/data/model/warehouses.dart';

class DataWarehouse {
    Warehouses warehouses;
    List<ShippingMethod> shippingMethods;

    DataWarehouse({
        required this.warehouses,
        required this.shippingMethods,
    });

    factory DataWarehouse.fromJson(Map<String, dynamic> json) => DataWarehouse(
        warehouses: Warehouses.fromJson(json["warehouses"]),
        shippingMethods: List<ShippingMethod>.from(json["shipping_methods"].map((x) => ShippingMethod.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "warehouses": warehouses.toJson(),
        "shipping_methods": List<dynamic>.from(shippingMethods.map((x) => x.toJson())),
    };
}
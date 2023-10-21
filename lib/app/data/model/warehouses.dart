import 'package:fish_nugket_warehourse/app/data/model/warehouse_store.dart';

class Warehouses {
  int sellerId;
  List<WarehouseStore> warehouseStores;

  Warehouses({
    required this.sellerId,
    required this.warehouseStores,
  });

  factory Warehouses.fromJson(Map<String, dynamic> json) => Warehouses(
        sellerId: json["seller_id"],
        warehouseStores: List<WarehouseStore>.from(
            json["warehouse_stores"].map((x) => WarehouseStore.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "seller_id": sellerId,
        "warehouse_stores":
            List<dynamic>.from(warehouseStores.map((x) => x.toJson())),
      };
}

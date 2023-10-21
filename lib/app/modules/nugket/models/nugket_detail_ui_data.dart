class NugketDetailUiData {
  double distance;
  String closeTime;
  String openTime;
  String warehouseNameEn;
  String warehouseNameTh;

    NugketDetailUiData({
        required this.closeTime,
        required this.distance,
         required this.openTime,
         required this.warehouseNameEn,
        required this.warehouseNameTh,
    });

    factory NugketDetailUiData.fromJson(Map<String, dynamic> json) => NugketDetailUiData(
        closeTime: json["close_time"],
         distance: json["distance"]?.toDouble(),
         openTime: json["open_time"],
         warehouseNameTh: json["warehouse_name_th"],
         warehouseNameEn: json["warehouse_name_en"],
    );

    Map<String, dynamic> toJson() => {
        "close_time": closeTime,
        "distance": distance,
        "open_time": openTime,
        "warehouse_name_en": warehouseNameEn,
        "warehouse_name_th": warehouseNameTh,
        
    };
}
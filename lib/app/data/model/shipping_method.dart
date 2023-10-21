import 'package:fish_nugket_warehourse/app/data/model/shipping_name.dart';

class ShippingMethod {
    String iconDisableImageEnUrl;
    List<int> sellerIds;
    int displaySequence;
    String iconDisableFilePath;
    String iconEnableFileEnPath;
    String shippingNameTh;
    String shortNameTh;
    List<String> paymentMethods;
    String fmsName;
    String warehouseType;
    int isActive;
    String iconEnableFilePath;
    String iconEnableImageUrl;
    String shortNameEn;
    String iconDisableFileEnPath;
    String shippingCode;
    int shippingId;
    String iconEnableImageEnUrl;
    String shippingType;
    List<ShippingName> shippingNames;
    String iconDisableImageUrl;
    String shippingNameEn;

    ShippingMethod({
        required this.iconDisableImageEnUrl,
        required this.sellerIds,
        required this.displaySequence,
        required this.iconDisableFilePath,
        required this.iconEnableFileEnPath,
        required this.shippingNameTh,
        required this.shortNameTh,
        required this.paymentMethods,
        required this.fmsName,
        required this.warehouseType,
        required this.isActive,
        required this.iconEnableFilePath,
        required this.iconEnableImageUrl,
        required this.shortNameEn,
        required this.iconDisableFileEnPath,
        required this.shippingCode,
        required this.shippingId,
        required this.iconEnableImageEnUrl,
        required this.shippingType,
        required this.shippingNames,
        required this.iconDisableImageUrl,
        required this.shippingNameEn,
    });

    factory ShippingMethod.fromJson(Map<String, dynamic> json) => ShippingMethod(
        iconDisableImageEnUrl: json["icon_disable_image_en_url"],
        sellerIds: List<int>.from(json["seller_ids"].map((x) => x)),
        displaySequence: json["display_sequence"],
        iconDisableFilePath: json["icon_disable_file_path"],
        iconEnableFileEnPath: json["icon_enable_file_en_path"],
        shippingNameTh: json["shipping_name_th"],
        shortNameTh: json["short_name_th"],
        paymentMethods: List<String>.from(json["payment_methods"].map((x) => x)),
        fmsName: json["fms_name"],
        warehouseType: json["warehouse_type"],
        isActive: json["is_active"],
        iconEnableFilePath: json["icon_enable_file_path"],
        iconEnableImageUrl: json["icon_enable_image_url"],
        shortNameEn: json["short_name_en"],
        iconDisableFileEnPath: json["icon_disable_file_en_path"],
        shippingCode: json["shipping_code"],
        shippingId: json["shipping_id"],
        iconEnableImageEnUrl: json["icon_enable_image_en_url"],
        shippingType: json["shipping_type"],
        shippingNames: List<ShippingName>.from(json["shipping_names"].map((x) => ShippingName.fromJson(x))),
        iconDisableImageUrl: json["icon_disable_image_url"],
        shippingNameEn: json["shipping_name_en"],
    );

    Map<String, dynamic> toJson() => {
        "icon_disable_image_en_url": iconDisableImageEnUrl,
        "seller_ids": List<dynamic>.from(sellerIds.map((x) => x)),
        "display_sequence": displaySequence,
        "icon_disable_file_path": iconDisableFilePath,
        "icon_enable_file_en_path": iconEnableFileEnPath,
        "shipping_name_th": shippingNameTh,
        "short_name_th": shortNameTh,
        "payment_methods": List<dynamic>.from(paymentMethods.map((x) => x)),
        "fms_name": fmsName,
        "warehouse_type": warehouseType,
        "is_active": isActive,
        "icon_enable_file_path": iconEnableFilePath,
        "icon_enable_image_url": iconEnableImageUrl,
        "short_name_en": shortNameEn,
        "icon_disable_file_en_path": iconDisableFileEnPath,
        "shipping_code": shippingCode,
        "shipping_id": shippingId,
        "icon_enable_image_en_url": iconEnableImageEnUrl,
        "shipping_type": shippingType,
        "shipping_names": List<dynamic>.from(shippingNames.map((x) => x.toJson())),
        "icon_disable_image_url": iconDisableImageUrl,
        "shipping_name_en": shippingNameEn,
    };
}
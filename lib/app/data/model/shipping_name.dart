import 'package:fish_nugket_warehourse/app/data/model/language.dart';

class ShippingName {
    Language language;
    String description;
    String descriptionShort;

    ShippingName({
        required this.language,
        required this.description,
        required this.descriptionShort,
    });

    factory ShippingName.fromJson(Map<String, dynamic> json) => ShippingName(
        language: languageValues.map[json["language"]]!,
        description: json["description"],
        descriptionShort: json["description_short"],
    );

    Map<String, dynamic> toJson() => {
        "language": languageValues.reverse[language],
        "description": description,
        "description_short": descriptionShort,
    };
}
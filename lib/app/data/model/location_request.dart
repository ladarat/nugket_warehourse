class LocationRequest {
  const LocationRequest({
    required this.count,
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toJson() => {
        "count": count,
        "latitude": latitude,
        "longitude": longitude,
      };

  factory LocationRequest.fromJson(Map<String, dynamic> json) =>
      LocationRequest(
        count: json['count'],
        latitude: json['latitude'] == null ? 0.0 : json['latitude'].toDouble(),
        longitude:json['longitude'] == null ? 0.0 : json['longitude'].toDouble(),
      );

  final int count;
  final double latitude;
  final double longitude;
}

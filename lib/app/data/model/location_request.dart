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

  final int count;
  final double latitude;
  final double longitude;
}
class Location {
  final String addressName;
  final String locationName;
  final num latitude;
  final num longitude;

  Location({
    required this.addressName,
    required this.locationName,
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      addressName: json['addressName'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      locationName: json['locationName'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['addressName'] = addressName;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['locationName'] = locationName;
    return data;
  }

  @override
  String toString() {
    return 'Location(addressName: $addressName, latitude: $latitude, longitude: $longitude, locationName: $locationName)';
  }

  Location copyWith({
    String? addressName,
    String? locationName,
    num? latitude,
    num? longitude,
  }) {
    return Location(
      addressName: addressName ?? this.addressName,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      locationName: locationName ?? this.locationName,
    );
  }
}

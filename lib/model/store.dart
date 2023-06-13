class Store {
  final double latitude;
  final double longitude;
  final String name;
  final String? website;

  const Store(
      {required this.name,
      required this.latitude,
      required this.longitude,
      this.website});

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      latitude: json['latitude'],
      longitude: json['longitude'],
      name: json['name'],
      website: json['website'],
    );
  }
}

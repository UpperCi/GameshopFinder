class Store {
  final double latitude;
  final double longitude;
  final String name;
  final String adress;
  final String email;
  // not all stores have a site
  final String? website;

  const Store(
      {required this.name,
      required this.latitude,
      required this.longitude,
      required this.adress,
      required this.email,
      this.website});

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      latitude: json['latitude'],
      longitude: json['longitude'],
      name: json['name'],
      email: json['emailAddress'],
      adress: json['postalAddress'],
      website: json['website'],
    );
  }
}

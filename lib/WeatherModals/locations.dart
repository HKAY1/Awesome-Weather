class Location {
  final String? city;
  final String? country;
  final String? lat;
  final String? lon;

  Location({this.city, this.country, this.lat, this.lon});

  factory Location.fromjson(Map<String, dynamic> json) {
    return Location(
      city: json[0]['name'],
      country: json[0]['country'],
      lat: json[0]['lat'],
      lon: json[0]['lon'],
    );
  }
}

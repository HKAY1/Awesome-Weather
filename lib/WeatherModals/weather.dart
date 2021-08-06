class Weather {
  final double? temp;
  final double? feelsLike;
  final double? uviIndex;
  final String? description;
  final double? pressure;
  final double? humidity;
  final double? wind;
  final String? icon;
  final int? rain;

  Weather(
      {this.temp,
      this.feelsLike,
      this.uviIndex,
      this.description,
      this.pressure,
      this.humidity,
      this.wind,
      this.icon,
      this.rain});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temp: json['current']['temp'].toDouble(),
      feelsLike: json['current']['feels_like'].toDouble(),
      description: json['current']['weather'][0]['description'],
      uviIndex: json['current']['uvi'].toDouble(),
      pressure: json['current']['pressure'].toDouble(),
      humidity: json['current']['humidity'].toDouble(),
      wind: json['current']['wind_speed'].toDouble(),
      icon: json['current']['weather'][0]['icon'],
      rain: json['current']['clouds'].toDouble(),
    );
  }
}

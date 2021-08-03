class Daily {
  final int? dt;
  final double? temp;
  final double? feelsLike;
  final double? low;
  final double? high;
  final double? pressure;
  final double? humidity;
  final double? wind;
  final String? description;
  final String? icon;

  Daily(
      {this.dt,
      this.temp,
      this.feelsLike,
      this.low,
      this.high,
      this.pressure,
      this.humidity,
      this.wind,
      this.description,
      this.icon});

  factory Daily.fromJson(Map<String, dynamic> json) {
    return Daily(
      dt: json['dt'].toInt(),
      temp: json['temp']['day'].toDouble(),
      feelsLike: json['feels_like']['day'].toDouble(),
      low: json['temp']['min'].toDouble(),
      high: json['temp']['max'].toDouble(),
      pressure: json['pressure'].toDouble(),
      humidity: json['humidity'].toDouble(),
      wind: json['wind_speed'].toDouble(),
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
    );
  }
}

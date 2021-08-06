import 'package:awesomeweather/WeatherModals/weather.dart';

import 'daily.dart';
import 'hourly.dart';

class Forecast {
  final List<Hourly>? hourly;
  final List<Daily>? daily;
  final Weather? currentWeather;

  Forecast({this.hourly, this.daily, this.currentWeather});

  factory Forecast.fromJson(Map<String, dynamic> json) {
    List<dynamic> hourlyData = json['hourly'];
    List<dynamic> dailyData = json['daily'];

    List<Hourly> hourly = <Hourly>[];
    List<Daily> daily = <Daily>[];

    Weather currentWeather = Weather.fromJson(json);

    hourlyData.forEach((item) {
      var hour = Hourly.fromJson(item);
      hourly.add(hour);
    });

    dailyData.forEach((item) {
      var day = Daily.fromJson(item);
      daily.add(day);
    });

    return Forecast(
      hourly: hourly,
      daily: daily,
      currentWeather: currentWeather,
    );
  }
}

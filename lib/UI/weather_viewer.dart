import 'package:awesomeweather/WeatherModals/forcast.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';

class WeatherViewe {
  static WeatherType weatherType(Weather weather) {
    var id = weather.id;
    if (id >= 200 && id <= 232 || id == 781) {
      return WeatherType.thunder;
    } else if ((id >= 300 && id <= 321) || (id == 500)) {
      return WeatherType.lightRainy;
    } else if (id >= 501 && id <= 503) {
      return WeatherType.middleRainy;
    } else if (id >= 504 && id <= 531) {
      return WeatherType.heavyRainy;
    } else if (id == 600 || (id >= 612 && id <= 621)) {
      return WeatherType.lightSnow;
    } else if (id == 601 || id == 611) {
      return WeatherType.middleSnow;
    } else if (id == 602 || id == 622) {
      return WeatherType.heavyRainy;
    } else if (id == 701 || (id == 741)) {
      return WeatherType.foggy;
    } else if (id == 731 || (id >= 751 && id <= 781)) {
      return WeatherType.dusty;
    } else if (id == 721) {
      return WeatherType.hazy;
    } else if ((id >= 801 && id <= 802) &&
        (['02d', '03d'].contains(weather.icon))) {
      return WeatherType.cloudy;
    } else if (id >= 803 && id <= 804) {
      return WeatherType.overcast;
    } else if ((id >= 801 && id <= 802) &&
        (['02n', '03n'].contains(weather.icon))) {
      return WeatherType.cloudyNight;
    } else if (id == 800 && weather.icon == '01d') {
      return WeatherType.sunny;
    } else if (id == 800 && weather.icon == '01n') {
      return WeatherType.sunnyNight;
    } else
      return WeatherType.hazy;
  }
}

import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';

class WeatherViewe {
  final String icon;
  final WeatherType weatherType;
  WeatherViewe({required this.icon, required this.weatherType});
}

var weatherViewer = <String, WeatherViewe>{
  '01d': WeatherViewe(icon: '', weatherType: WeatherType.sunny),
  '01n': WeatherViewe(icon: '', weatherType: WeatherType.sunnyNight),
  '02d': WeatherViewe(icon: '', weatherType: WeatherType.cloudy),
  '02n': WeatherViewe(icon: '', weatherType: WeatherType.cloudyNight),
  '03d': WeatherViewe(icon: '', weatherType: WeatherType.overcast),
  '03n': WeatherViewe(icon: '', weatherType: WeatherType.overcast),
  '04d': WeatherViewe(icon: '', weatherType: WeatherType.hazy),
  '04n': WeatherViewe(icon: '', weatherType: WeatherType.hazy),
  '09d': WeatherViewe(icon: '', weatherType: WeatherType.lightRainy),
  '09n': WeatherViewe(icon: '', weatherType: WeatherType.lightRainy),
  '10d': WeatherViewe(icon: '', weatherType: WeatherType.heavyRainy),
  '10n': WeatherViewe(icon: '', weatherType: WeatherType.heavyRainy),
  '11d': WeatherViewe(icon: '', weatherType: WeatherType.thunder),
  '11n': WeatherViewe(icon: '', weatherType: WeatherType.thunder),
  '13d': WeatherViewe(icon: '', weatherType: WeatherType.heavySnow),
  '13n': WeatherViewe(icon: '', weatherType: WeatherType.heavySnow),
  '50d': WeatherViewe(icon: '', weatherType: WeatherType.foggy),
  '50n': WeatherViewe(icon: '', weatherType: WeatherType.foggy),
};

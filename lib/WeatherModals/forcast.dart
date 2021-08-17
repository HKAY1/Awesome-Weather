import 'dart:convert';

Forecast forecastFromJson(String str) => Forecast.fromJson(json.decode(str));

String forecastToJson(Forecast data) => json.encode(data.toJson());

class Forecast {
  Forecast({
    required this.timezone,
    required this.current,
    required this.hourly,
    required this.daily,
  });

  final String timezone;
  final Current current;
  final List<Current> hourly;
  final List<Daily> daily;

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        timezone: json["timezone"],
        current: Current.fromJson(json["current"]),
        hourly:
            List<Current>.from(json["hourly"].map((x) => Current.fromJson(x))),
        daily: List<Daily>.from(json["daily"].map((x) => Daily.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "timezone": timezone,
        "current": current.toJson(),
        "hourly": List<dynamic>.from(hourly.map((x) => x.toJson())),
        "daily": List<dynamic>.from(daily.map((x) => x.toJson())),
      };
}

class Current {
  Current({
    required this.dt,
    // required this.sunrise,
    // required this.sunset,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.uvi,
    required this.clouds,
    required this.windSpeed,
    required this.windDeg,
    required this.weather,
  });

  final int dt;
  // final int sunrise;
  // final int sunset;
  final double temp;
  final double feelsLike;
  final double pressure;
  final int humidity;
  final double uvi;
  final int clouds;
  final double windSpeed;
  final int windDeg;
  final List<Weather> weather;

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        dt: json["dt"],
        // sunrise: json["sunrise"],
        // sunset: json["sunset"],
        temp: json["temp"].toDouble(),
        feelsLike: json["feels_like"].toDouble(),
        pressure: json["pressure"].toDouble(),
        humidity: json["humidity"].toInt(),
        uvi: json["uvi"].toDouble(),
        clouds: json["clouds"].toInt(),
        windSpeed: json["wind_speed"].toDouble(),
        windDeg: json["wind_deg"],
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "dt": dt,
        // "sunrise": sunrise,
        // "sunset": sunset,
        "temp": temp,
        "feels_like": feelsLike,
        "pressure": pressure,
        "humidity": humidity,
        "uvi": uvi,
        "clouds": clouds,
        "wind_speed": windSpeed,
        "wind_deg": windDeg,
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
      };
}

class Weather {
  Weather({
    required this.main,
    required this.description,
    required this.icon,
  });

  final String main;
  final String description;
  final String icon;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        main: json['main'],
        description: json["description"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "main": main,
        "description": description,
        "icon": icon,
      };
}

class Daily {
  Daily({
    required this.dt,
    required this.temp,
    required this.windSpeed,
    required this.windDeg,
  });
  final int dt;
  final Temp temp;
  final double windSpeed;
  final int windDeg;

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        dt: json["dt"],
        temp: Temp.fromJson(json["temp"]),
        windSpeed: json["wind_speed"].toDouble(),
        windDeg: json["wind_deg"],
      );

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "temp": temp.toJson(),
        "wind_speed": windSpeed,
        "wind_deg": windDeg,
      };
}

class Temp {
  Temp({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  final double day;
  final double min;
  final double max;
  final double night;
  final double eve;
  final double morn;

  factory Temp.fromJson(Map<String, dynamic> json) => Temp(
        day: json["day"].toDouble(),
        min: json["min"].toDouble(),
        max: json["max"].toDouble(),
        night: json["night"].toDouble(),
        eve: json["eve"].toDouble(),
        morn: json["morn"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "min": min,
        "max": max,
        "night": night,
        "eve": eve,
        "morn": morn,
      };
}

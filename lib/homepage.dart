import 'package:awesomeweather/Bloc/weather_bloc.dart';
import 'package:awesomeweather/Bloc/weather_state.dart';
import 'package:awesomeweather/UI/Details.dart';
import 'package:awesomeweather/UI/currentWeather.dart';
import 'package:awesomeweather/UI/dailyForcast.dart';
import 'package:awesomeweather/UI/hourlyForcast.dart';
import 'package:awesomeweather/UI/search0.2.dart';
import 'package:awesomeweather/UI/weather_viewer.dart';
import 'package:awesomeweather/WeatherModals/forcast.dart';
import 'package:awesomeweather/WeatherModals/locations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'Bloc/weather_event.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitial) {
            return WeatherSearch();
          } else if (state is WeatherLoading) {
            return Loading();
          } else if (state is WeatherLoaded) {
            return Awesome(forecast: state.forecast, location: state.location);
          } else {
            return WeatherSearch();
          }
        },
      ),
    );
  }
}

class WeatherSearch extends StatelessWidget {
  WeatherSearch({Key? key}) : super(key: key);
  final TextEditingController text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blueAccent, Colors.purpleAccent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Enter your city",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 40),
              TextField(
                controller: text,
                onSubmitted: (text) =>
                    context.read<WeatherBloc>().add(GetWeather(text)),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class Awesome extends StatelessWidget {
  Awesome({Key? key, required this.forecast, required this.location})
      : super(key: key);

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final Forecast forecast;
  final Location location;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WeatherBg(
          weatherType: weatherViewer['${forecast.hourly[0].weather[0].icon}']!
              .weatherType,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        Column(children: [
          Container(
            child: AppBar(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
              elevation: 0,
              title: Text('Awesome Weather'),
              backgroundColor: Colors.transparent,
              actions: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: IconButton(
                    focusColor: Colors.transparent,
                    splashColor: Colors.blue[200],
                    hoverColor: Colors.transparent,
                    onPressed: () async {
                      String city = await showSearch(
                              context: context, delegate: Search2()) ??
                          location.name;
                      if (city.isEmpty) {
                        city = location.name;
                      }
                      print(city);
                      context.read<WeatherBloc>().add(GetWeather(city));
                    },
                    icon: Icon(Icons.search_rounded),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SmartRefresher(
              controller: _refreshController,
              onRefresh: () {
                context.read<WeatherBloc>().add(ResetWeather(location.name));
              },
              child: ListView(
                physics: BouncingScrollPhysics(),
                padding:
                    EdgeInsets.only(left: 20, top: 30, right: 20, bottom: 50),
                children: [
                  CurrentWeather(
                    forecast: forecast,
                    location: location,
                  ),
                  Divider(
                    color: Colors.white60,
                    height: 10,
                    thickness: 1,
                  ),
                  HourlyForecast(hourly: forecast.hourly),
                  Divider(
                    color: Colors.white60,
                    height: 50,
                    thickness: 1,
                  ),
                  DailyForecast(daily: forecast.daily),
                  Divider(
                    color: Colors.white60,
                    height: 50,
                    thickness: 1,
                  ),
                  Details(details: forecast)
                ],
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Open Weather Map',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Updated 20/07 8:30 pm',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 5),
                  IconButton(
                    color: Colors.white,
                    onPressed: () => context
                        .read<WeatherBloc>()
                        .add(ResetWeather(location.name)),
                    icon: Icon(Icons.refresh),
                  )
                ],
              ),
            ),
          ),
        ])
      ],
    );
  }
}

class ErrorWeather extends StatelessWidget {
  const ErrorWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          'Something Went Wrong ',
          style: TextStyle(color: Colors.purple, fontSize: 40),
        ),
      ),
    );
  }
}

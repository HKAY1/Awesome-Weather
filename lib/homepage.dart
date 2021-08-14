import 'package:awesomeweather/Bloc/weather_bloc.dart';
import 'package:awesomeweather/Bloc/weather_state.dart';
import 'package:awesomeweather/UI/Details.dart';
import 'package:awesomeweather/UI/currentWeather.dart';
import 'package:awesomeweather/UI/dailyForcast.dart';
import 'package:awesomeweather/UI/hourlyForcast.dart';
import 'package:awesomeweather/WeatherModals/forcast.dart';
import 'package:awesomeweather/WeatherModals/locations.dart';
import 'package:awesomeweather/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'Bloc/weather_event.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

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
            return Awesome(
              forecast: state.forecast,
              location: state.location,
            );
          } else {
            return ErrorWeather();
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
  const Awesome({Key? key, required this.forecast, required this.location})
      : super(key: key);

  final Forecast forecast;
  final Location location;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WeatherBg(
          weatherType: WeatherType.cloudyNight,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        Column(
          children: [
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
                      onPressed: () =>
                          showSearch(context: context, delegate: Search()),
                      icon: Icon(Icons.search_rounded),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                padding:
                    EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 50),
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
            GlassmorphicContainer(
              linearGradient:
                  LinearGradient(colors: [Colors.white30, Colors.white30]),
              borderGradient:
                  LinearGradient(colors: [Colors.white30, Colors.white30]),
              width: MediaQuery.of(context).size.width,
              height: 50,
              blur: 20,
              borderRadius: 0,
              border: 0,
              child: Center(
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
                        onPressed: () => print('object'),
                        icon: Icon(Icons.refresh),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
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

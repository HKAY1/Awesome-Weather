import 'dart:ui';

import 'package:awesomeweather/UI/Details.dart';
import 'package:awesomeweather/UI/currentWeather.dart';
import 'package:awesomeweather/UI/dailyForcast.dart';
import 'package:awesomeweather/UI/hourlyForcast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherSearch extends SearchDelegate<String> {
  final cities = [
    'Delhi',
    'Kolkata',
    'Mumbai',
    'Chennai',
    'Bangalore',
    'Dehradun',
    'Punjab',
    'Uttar Pradesh',
    'Bihar'
  ];
  final recentCities = ['Delhi', 'Mumbai', 'Bangalore'];
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
            ),
        hintColor: Colors.white54);
  }

  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, '');
            } else {
              query = '';
              showSuggestions(context);
            }
          },
          icon: Icon(Icons.clear),
        )
      ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => close(context, ''),
      );

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueAccent,
      ),
      child: Stack(
        children: [
          WeatherBg(
            weatherType: WeatherType.lightRainy,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0.1, sigmaY: 0.1),
            child: ListView(
              physics: BouncingScrollPhysics(),
              padding:
                  EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 50),
              children: [
                CurrentWeather(),
                Divider(
                  color: Colors.white60,
                  height: 10,
                  thickness: 1,
                ),
                HourlyForcast(),
                Divider(
                  color: Colors.white60,
                  height: 50,
                  thickness: 1,
                ),
                DailyForcast(),
                Divider(
                  color: Colors.white60,
                  height: 50,
                  thickness: 1,
                ),
                Details()
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty
        ? recentCities
        : cities.where((cities) {
            final cityLower = cities.toLowerCase();
            final queryLower = query.toLowerCase();
            return cityLower.startsWith(queryLower);
          }).toList();
    return buildSuggestionsSuccess(suggestions);
  }

  Widget buildSuggestionsSuccess(List<String> suggestions) {
    return Container(
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/weather.png"), fit: BoxFit.cover)),
        ),
        ListView.builder(
            itemCount: suggestions.length,
            itemBuilder: (context, index) {
              final suggestion = suggestions[index];
              return ListTile(
                tileColor: Colors.transparent,
                onTap: () {
                  query = suggestion;
                  showResults(context);
                },
                leading: Icon(Icons.location_city, color: Colors.white),
                title: Text(suggestion),
              );
            }),
      ]),
    );
  }
}

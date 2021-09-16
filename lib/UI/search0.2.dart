import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:awesomeweather/Bloc/weather_bloc.dart';
import 'package:awesomeweather/Bloc/weather_event.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchSuggestions {
  static const apiID = '1f077d605f0216ac404a053d35569e05';
  static Future<List<String>> searchCities(TextEditingController query) async {
    final cityName = query.text;
    final geolocationbaseURL =
        'http://api.openweathermap.org/geo/1.0/direct?q=';
    final url = geolocationbaseURL + cityName + '&limit=3&appid=' + apiID;
    final response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode != 200) throw Exception();
    final body = json.decode(response.body);
    print(body);
    return body.map<String>((json) {
      final city = json['name'];
      final country = json['country'];
      return '$city, $country';
    }).toList();
  }
}

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final recentCities = [
    'Delhi',
    'Mumbai',
    'Bangalore',
    'Chennai',
    'Dehradun',
    'Punjab',
    'Uttar Pradesh',
    'Los Angeles',
    'Bihar',
    'New York',
    'Las Vegas'
  ];
  List<String> cities = [''];
  final TextEditingController query = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blueAccent),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back)),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.black,
        title: Center(
          child: Container(
            constraints: BoxConstraints(maxHeight: 40, maxWidth: 400),
            child: TextField(
              textAlign: TextAlign.center,
              onChanged: (text) async {
                var t = await SearchSuggestions.searchCities(query);
                setState(() {
                  cities = t == [] ? recentCities : t;
                });
              },
              cursorColor: Colors.cyanAccent,
              cursorRadius: Radius.circular(5),
              cursorWidth: 4,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              controller: query,
              cursorHeight: 25,
              onSubmitted: (text) {
                close(context, query);
              },
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(30),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                if (query.text == '') {
                  Navigator.of(context).pop();
                } else {
                  query.text = '';
                  setState(() {
                    cities = recentCities;
                  });
                }
              },
              icon: Icon(Icons.clear))
        ],
      ),
      body: buildSuggestions(context),
    );
  }


  close(BuildContext context, TextEditingController query) {
    context.read<WeatherBloc>().add(GetWeather(query.text));
    Navigator.of(context).pop();
  }

  Widget buildSuggestions(BuildContext context) => FutureBuilder<List<String>>(
      future: SearchSuggestions.searchCities(query),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          case ConnectionState.none:
            return buildPopularCities(context, recentCities);
          default:
            if (snapshot.hasData)
              return buildPopularCities(context, cities);
            else {
              return buildPopularCities(context, recentCities);
            }
        }
      });

  List<Widget> recentCity(BuildContext context, List<String>? city) {
    int count = city!.length;
    return List<Widget>.generate(
        count,
        (i) => GestureDetector(
              onTap: () {
                query.text = city[i];
                close(context, query);
              },
              child: Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white24,
                ),
                child: Text(
                  city[i],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ),
            )).toList();
  }

  Widget buildPopularCities(BuildContext context, List<String> recents) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        padding: EdgeInsets.only(top: 20, right: 5),
        children: [
          Wrap(
            children: [
              Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white24,
                ),
                child: Text(
                  'Locate',
                  style: TextStyle(
                    color: Colors.cyanAccent,
                    fontSize: 15,
                  ),
                ),
              ),
              Wrap(children: recentCity(context, recents)),
            ],
          )
        ],
      ),
    );
  }
}

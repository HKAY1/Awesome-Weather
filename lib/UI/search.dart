import 'package:awesomeweather/Bloc/bloc.dart';
import 'package:awesomeweather/Bloc/weather_state.dart';
import 'package:awesomeweather/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class SearchLoading extends StatelessWidget {
//   const SearchLoading({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: CircularProgressIndicator(),
//     );
//   }
// }

// class SearchError extends StatelessWidget {
//   const SearchError({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         child: Text(
//           'Something Went Wrong ',
//           style: TextStyle(color: Colors.purple, fontSize: 40),
//         ),
//       ),
//     );
//   }
// }

// class SearchPage extends StatelessWidget {
//   const SearchPage({Key? key, required this.forecast, required this.location})
//       : super(key: key);

//   final Forecast forecast;
//   final Location location;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         WeatherBg(
//           weatherType: WeatherType.cloudyNight,
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//         ),
//         Column(
//           children: [
//             Expanded(
//               child: ListView(
//                 physics: BouncingScrollPhysics(),
//                 padding:
//                     EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 50),
//                 children: [
//                   CurrentWeather(
//                     forecast: forecast,
//                     location: location,
//                   ),
//                   Divider(
//                     color: Colors.white60,
//                     height: 10,
//                     thickness: 1,
//                   ),
//                   HourlyForecast(hourly: forecast.hourly),
//                   Divider(
//                     color: Colors.white60,
//                     height: 50,
//                     thickness: 1,
//                   ),
//                   DailyForecast(daily: forecast.daily),
//                   Divider(
//                     color: Colors.white60,
//                     height: 50,
//                     thickness: 1,
//                   ),
//                   Details(details: forecast)
//                 ],
//               ),
//             ),
//             GlassmorphicContainer(
//               linearGradient:
//                   LinearGradient(colors: [Colors.white30, Colors.white30]),
//               borderGradient:
//                   LinearGradient(colors: [Colors.white30, Colors.white30]),
//               width: MediaQuery.of(context).size.width,
//               height: 50,
//               blur: 20,
//               borderRadius: 0,
//               border: 0,
//               child: Center(
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 20, right: 10),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'Open Weather Map',
//                               style: TextStyle(color: Colors.white),
//                             ),
//                             Text(
//                               'Updated 20/07 8:30 pm',
//                               style: TextStyle(color: Colors.white),
//                             )
//                           ],
//                         ),
//                       ),
//                       SizedBox(width: 5),
//                       IconButton(
//                         color: Colors.white,
//                         onPressed: () => print('object'),
//                         icon: Icon(Icons.refresh),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

class Search extends SearchDelegate<String> {
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
        appBarTheme: AppBarTheme(color: Colors.black54),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
            ));
  }

  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(
          onPressed: () {
            close(context, query);
          },
          icon: Icon(Icons.search_rounded),
        )
      ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, query);
        },
      );

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: BlocBuilder<WeatherBloc, WeatherState>(
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
          color: Colors.black87,
        )),
        ListView.builder(
            itemCount: suggestions.length,
            itemBuilder: (context, index) {
              final suggestion = suggestions[index];
              return ListTile(
                tileColor: Colors.transparent,
                onTap: () {
                  query = suggestion;
                  close(context, query);
                },
                leading: Icon(Icons.location_city, color: Colors.white),
                title: Text(suggestion),
              );
            }),
      ]),
    );
  }
}

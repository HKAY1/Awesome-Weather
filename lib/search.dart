import 'package:flutter/material.dart';

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
          query = 'delhi';
          close(context, query);
        },
      );
  @override
  void showResults(BuildContext context) {
    close(context, query);
  }

  @override
  Widget buildResults(BuildContext context) => Container();

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
          //image: DecorationImage(
          //image: AssetImage("images/weather.png"), fit: BoxFit.cover)),
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

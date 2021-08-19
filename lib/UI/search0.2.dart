import 'package:flutter/material.dart';

class Search2 extends SearchDelegate<String> {
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

  @override
  String get searchFieldLabel => ' Search Your City';

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      textTheme: TextTheme(headline6: TextStyle(color: Colors.white)),
      textSelectionTheme:
          TextSelectionThemeData(cursorColor: Colors.cyanAccent),
      inputDecorationTheme: InputDecorationTheme(
        constraints: BoxConstraints(maxHeight: 50),
        hintStyle: TextStyle(color: Colors.white30),
        contentPadding: EdgeInsets.all(20),
        fillColor: Colors.white12,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
      primaryColor: Colors.white,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.blueAccent),
        elevation: 10,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.black,
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(
          onPressed: () {
            close(context, query);
          },
          icon: Icon(Icons.search_rounded),
          iconSize: 25,
        )
      ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
        icon: Icon(
          Icons.keyboard_arrow_left,
          size: 35,
        ),
        onPressed: () {
          close(context, query);
        },
      );
  @override
  void showResults(BuildContext context) {
    close(context, query);
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return buildPopularCities(context, recentCities);
    } else {
      final suggestions = cities.where((cities) {
        final cityLower = cities.toLowerCase();
        final queryLower = query.toLowerCase();
        return cityLower.startsWith(queryLower);
      }).toList();
      return buildSuggestionsSuccess(suggestions);
    }
  }

  Widget buildPopularCities(BuildContext context, List<String> recents) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        padding: EdgeInsets.only(top: 20, right: 5),
        children: [
          Row(
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
              GestureDetector(
                onTap: () {
                  query = recents[0];
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
                    recents[0],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  query = recents[1];
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
                    recents[1],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  query = recents[2];
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
                    recents[2],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  query = recents[3];
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
                    recents[3],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  query = recents[4];
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
                    recents[4],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  query = recents[5];
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
                    recents[5],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  query = recents[6];
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
                    recents[6],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  query = recents[7];
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
                    recents[7],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  query = recents[8];
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
                    recents[8],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  query = recents[9];
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
                    recents[9],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  query = recents[10];
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
                    recents[10],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget buildSuggestionsSuccess(List<String> suggestions) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: suggestions.length,
          itemBuilder: (context, index) {
            final suggestion = suggestions[index];
            return GestureDetector(
              onTap: () {
                query = suggestion;
                close(context, query);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                margin: EdgeInsets.all(10),
                color: Colors.blueGrey[900],
                child: Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10, left: 30),
                  child: Text(
                    suggestion,
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

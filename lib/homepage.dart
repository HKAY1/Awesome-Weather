import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:awesomeweather/UI/Details.dart';
import 'package:awesomeweather/UI/currentWeather.dart';
import 'package:awesomeweather/UI/dailyForcast.dart';
import 'package:awesomeweather/UI/hourlyForcast.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //static AudioCache player = AudioCache(prefix: 'assets/audio/');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        title: Text('Awesome Weather'),
        backgroundColor: Colors.blueAccent,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: IconButton(
              focusColor: Colors.transparent,
              splashColor: Colors.blue[200],
              hoverColor: Colors.transparent,
              onPressed: () {
                final player = AudioCache(prefix: 'assests/audio');
                player.loop('heavy-rain.mp3');
              },
              icon: Icon(Icons.search_rounded),
            ),
          )
        ],
      ),
      bottomSheet: Container(
        padding: EdgeInsets.only(left: 20, right: 3),
        decoration: BoxDecoration(
          color: Colors.purpleAccent,
        ),
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
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.purpleAccent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
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
}

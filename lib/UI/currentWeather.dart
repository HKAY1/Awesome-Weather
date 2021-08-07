import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CurrentWeather extends StatefulWidget {
  CurrentWeather({Key? key}) : super(key: key);

  @override
  _CurrentWeatherState createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            'Camp',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(height: 5),
          Text(
            'Sat 31 Jul 2021',
            style: TextStyle(
              color: Colors.white60,
              fontWeight: FontWeight.w300,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.cloud,
                  color: Colors.white,
                  size: 100,
                ),
                SizedBox(width: 20),
                Text(
                  '33\u00B0',
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(fontSize: 100, color: Colors.white)),
                ),
              ],
            ),
          ),
          Container(
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '31\u00B0 / 26\u00B0',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w300),
                ),
                VerticalDivider(
                  thickness: 1,
                  width: 50,
                  color: Colors.white60,
                ),
                Text(
                  'Real Feel 30\u00B0',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w300),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 30),
            child: Text(
              'Cloudy',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}

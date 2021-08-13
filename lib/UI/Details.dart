import 'dart:ui';
import 'package:awesomeweather/WeatherModals/forcast.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({Key? key, required this.details}) : super(key: key);
  final Forecast details;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.white.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 10,
      color: Colors.white.withOpacity(0.1),
      child: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 25),
              child: Text(
                'DETAILS',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'Wind Speed',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 10,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '${details.current.windSpeed}',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    )
                  ],
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                Column(
                  children: [
                    Text(
                      'Humidity',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      '${details.current.humidity}%',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'Pressure',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      '${details.current.pressure} hpa',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    )
                  ],
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          'Chance of Rain',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          '${details.current.clouds}%',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

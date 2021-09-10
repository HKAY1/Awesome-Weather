import 'package:awesomeweather/UI/weatherconverter.dart';
import 'package:awesomeweather/WeatherModals/forcast.dart';
import 'package:flutter/material.dart';

class HourlyForecast extends StatelessWidget {
  const HourlyForecast({Key? key, required this.hourly}) : super(key: key);
  final List<Current> hourly;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 25, bottom: 15),
            child: Text(
              'HOURLY',
              style: TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: 180,
            child: ListView.separated(
              separatorBuilder: (context, index) => VerticalDivider(
                color: Colors.transparent,
                thickness: 25,
              ),
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: (hourly.length ~/ 4).toInt(),
              itemBuilder: (context, item) => Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                width: MediaQuery.of(context).size.width * 0.12,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      getTime(timestamp: hourly[item].dt, format: 'hh a'),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 20),
                    ImageIcon(
                      AssetImage(
                          'Assets/images/${hourly[item].weather[0].icon}.png'),
                      color: Colors.white,
                      size: 60,
                    ),
                    SizedBox(height: 20),
                    Text(
                      converter(hourly[item].temp),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 13),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:awesomeweather/UI/weatherconverter.dart';
import 'package:awesomeweather/WeatherModals/forcast.dart';
import 'package:flutter/material.dart';

class DailyForecast extends StatelessWidget {
  const DailyForecast({Key? key, required this.daily}) : super(key: key);
  final List<Daily> daily;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 15, bottom: 25),
            child: Text(
              'Daily',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: 140,
            child: ListView.separated(
              separatorBuilder: (context, index) => VerticalDivider(
                color: Colors.white60,
              ),
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(left: 10, right: 10),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: daily.length,
              itemBuilder: (context, item) => Container(
                margin: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width * 0.12,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      getDate(timestamp: daily[item].dt, format: 'EEE d'),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 20),
                    Icon(
                      Icons.cloud,
                      color: Colors.white,
                      size: 20,
                    ),
                    SizedBox(height: 20),
                    Text(
                      converter(daily[item].temp.max),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
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

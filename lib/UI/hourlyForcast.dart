import 'package:flutter/material.dart';

class HourlyForcast extends StatefulWidget {
  HourlyForcast({Key? key}) : super(key: key);

  @override
  _HourlyForcastState createState() => _HourlyForcastState();
}

class _HourlyForcastState extends State<HourlyForcast> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 15, bottom: 25),
            child: Text(
              'HOURLY',
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
              itemCount: 7,
              itemBuilder: (context, item) => Container(
                margin: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width * 0.12,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '$item PM',
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
                      '60%',
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

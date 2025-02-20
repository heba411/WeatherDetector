import 'package:flutter/material.dart';
import '../../domain/entities/weather.dart';

class WeatherDisplay extends StatelessWidget {
  final WeatherEntity weather;

  const WeatherDisplay({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 20,),
        Text(
            weather.cityName,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              color: Colors.white,
            )
        ),
        Text(
            weather.country,
            style: TextStyle(
                fontSize: 18,
                color: Color(0XFFc9dce9),
            )
        ),
        // SizedBox(height: 10),
        if(weather.condition == 'Overcast')
          Image(
            image:AssetImage('assets/images/cloud.png'),
            // width: 300,
            // height: 300,
          ),
        Text(
            "${weather.temp}°c",
            style: TextStyle(
                fontSize: 52,
                fontWeight: FontWeight.bold,
              color: Colors.white,
            )
        ),
        Text(
            weather.condition,
            style: TextStyle(
                fontSize: 22,
              color: Colors.white,
            )
        ),
      ],
    );
  }
}

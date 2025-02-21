import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/features/home/domain/entities/weather.dart';
import 'package:weather_app/features/home/presentation/widgets/weather_detail.dart';

Widget buildweatherContainer(WeatherEntity weather,double screenWidth) {
  return Container(
    padding: EdgeInsets.all(screenWidth * 0.05),
    margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.2),
      borderRadius: BorderRadius.circular(screenWidth * 0.05),
      border: Border.all(color: Colors.white.withOpacity(0.3)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        weatherDetail(Icons.wind_power, "${weather.windSpeed} km/h", "Wind"),
        weatherDetail(Icons.water_drop, "${weather.humidity}%", "Humidity"),
        weatherDetail(Icons.visibility, "${weather.visibility} km", "Visibility"),
      ],
    ),
  );
}

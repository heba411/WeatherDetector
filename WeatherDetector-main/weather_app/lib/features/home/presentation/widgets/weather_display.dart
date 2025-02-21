import 'package:flutter/material.dart';
import 'package:weather_app/core/style/colors.dart';
import 'package:weather_app/features/home/presentation/widgets/weather_container.dart';
import '../../domain/entities/weather.dart';
import 'forecase_item.dart';

class WeatherWidget extends StatelessWidget {
  final WeatherEntity weather;

  const WeatherWidget({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: PRIMARY_COLOR,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenWidth * 0.05),
            Text(
              weather.cityName,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: screenWidth * 0.05),
            Image(
              image: AssetImage('assets/images/cloud.png'),
            ),
            Text(
              "${weather.temperature}°c",
              style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Text(
              weather.condition,
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
            SizedBox(height: screenWidth * 0.05),
            buildweatherContainer(weather,screenWidth),
            SizedBox(height: screenWidth * 0.05),
            SizedBox(
              height: screenWidth * 0.35,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: weather.forecast.length,
                itemBuilder: (context, index) {
                  final forecast = weather.forecast[index];
                  return buildForecastCard(forecast.date, forecast.iconUrl, forecast.maxTemp, forecast.minTemp,screenWidth);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

}

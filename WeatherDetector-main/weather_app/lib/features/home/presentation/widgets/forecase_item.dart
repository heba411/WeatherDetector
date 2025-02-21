import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildForecastCard(String date, String iconUrl, double maxTemp, double minTemp,double screenWidth) {
  return Container(
    width: screenWidth * 0.3,
    margin: EdgeInsets.symmetric(horizontal: 8),
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.2),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Column(
      children: [
        Text(date, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
        Image.network(iconUrl, height: 50),
        Text("Max: $maxTemp°C", style: TextStyle(color: Colors.white)),
        Text("Min: $minTemp°C", style: TextStyle(color: Colors.white70)),
      ],
    ),
  );
}

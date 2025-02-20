import 'package:weather_app/features/auth/domain/entities/weather.dart';

class WeatherModel extends WeatherEntity
{
  WeatherModel({
    required String cityName,
    required String country,
    required double temp,
    required String condition,
    required String iconURL,
}) : super(
    cityName: cityName,
    country: country,
    condition: condition,
    iconURL: iconURL,
    temp: temp,
  );

  factory WeatherModel.fromJson(Map<String,dynamic> json)
  {
    return WeatherModel(
        cityName: json['location']['name'],
        country: json['location']['country'],
        temp: json['current']['temp_c'],
        condition: json['current']['condition']['text'],
        iconURL:  "https:" + json['current']['condition']['icon']);
  }

}
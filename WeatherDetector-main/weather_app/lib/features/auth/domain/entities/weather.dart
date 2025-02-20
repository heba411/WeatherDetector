import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable
{
  final String cityName;
  final String country;
  final double temp;
  final String condition;
  final String iconURL;

  const WeatherEntity({
    required this.cityName,
    required this.country,
    required this.temp,
    required this.condition,
    required this.iconURL
});
  @override
  List<Object> get props => [cityName, country, temp, condition, iconURL];
}
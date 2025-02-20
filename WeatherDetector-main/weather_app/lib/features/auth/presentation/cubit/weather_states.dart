import '../../domain/entities/weather.dart';

abstract class WeatherStates {}

class WeatherInitialState extends WeatherStates {}

class WeatherLoadingState extends WeatherStates {}

class WeatherSuccessState extends WeatherStates {
  final WeatherEntity weather;
  WeatherSuccessState(this.weather);
}

class WeatherErrorState extends WeatherStates {
  final String message;
  WeatherErrorState(this.message);
}

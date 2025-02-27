import '../../domain/entities/weather.dart';

abstract class WeatherStates {}

class WeatherInitialState extends WeatherStates {}

class WeatherLoadingState extends WeatherStates {}

class WeatherSuccessState extends WeatherStates {
  final WeatherEntity weather;
  final int prediction; // 0 (Go) or 1 (Stay Home)
  WeatherSuccessState(this.weather, this.prediction);
}


class WeatherErrorState extends WeatherStates {
  final String message;
  WeatherErrorState(this.message);
}

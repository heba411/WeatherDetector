import '../entities/weather.dart';

abstract class WeatherRepository {
  Future<WeatherEntity> getWeather(String cityName);
}

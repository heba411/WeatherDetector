import '../entities/weather.dart';
import '../repos/weather_repo.dart';

class GetWeather {
  final WeatherRepository repository;

  GetWeather(this.repository);

  Future<WeatherEntity> call(String cityName) {
    return repository.getWeather(cityName);
  }
}

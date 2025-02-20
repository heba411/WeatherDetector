import 'package:dio/dio.dart';
import '../../domain/entities/weather.dart';
import '../../domain/repos/weather_repo.dart';
import '../models/weather_model.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final Dio dio;
  WeatherRepositoryImpl(this.dio);

  @override
  Future<WeatherEntity> getWeather(String cityName) async {
    final response = await dio.get(
      "https://api.weatherapi.com/v1/current.json?key=a69003beaecb4bf2b6e235713251602&q=$cityName",
    );

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(response.data);
    } else {
      throw Exception("Failed to load weather data");
    }
  }
}

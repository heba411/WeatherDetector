import 'package:dio/dio.dart';
import '../../domain/entities/weather.dart';
import '../../domain/repos/weather_repo.dart';
import '../models/weather_model.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final Dio dio;

  WeatherRepositoryImpl({required this.dio});

  @override
  Future<WeatherEntity> getWeather(String cityName) async {
    try {
      final response = await dio.get(
        'http://api.weatherapi.com/v1/forecast.json',
        queryParameters: {
          'key': 'a69003beaecb4bf2b6e235713251602',
          'q': cityName,
          'days': 3,
          'aqi': 'no',
          'alerts': 'no',
        },
      );

      print("API Response: ${response.data}");

      return WeatherModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception("Failed to load weather: ${e.response?.statusCode}");
    }
  }
}

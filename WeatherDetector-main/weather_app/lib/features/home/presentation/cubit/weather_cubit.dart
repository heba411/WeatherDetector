import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/weather.dart';
import '../../domain/usecases/weather_useCase.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}
class WeatherLoading extends WeatherState {}
class WeatherLoaded extends WeatherState {
  final WeatherEntity weather;
  WeatherLoaded(this.weather);
}
class WeatherError extends WeatherState {
  final String message;
  WeatherError(this.message);
}

class WeatherCubit extends Cubit<WeatherState> {
  final GetWeather getWeatherUseCase;

  WeatherCubit(this.getWeatherUseCase) : super(WeatherInitial());

  void fetchWeather(String cityName) async {
    emit(WeatherLoading());
    try {
      final weather = await getWeatherUseCase(cityName);
      emit(WeatherLoaded(weather));
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/auth/presentation/cubit/weather_states.dart';
import '../../domain/usecases/weather_useCase.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  final GetWeather getWeather;

  WeatherCubit(this.getWeather) : super(WeatherInitialState());

  Future<void> getWeatherData(String cityName) async {
    emit(WeatherLoadingState());
    try {
      final weather = await getWeather(cityName);
      emit(WeatherSuccessState(weather));
    } catch (e) {
      emit(WeatherErrorState("Failed to get the weather data"));
    }
  }
}

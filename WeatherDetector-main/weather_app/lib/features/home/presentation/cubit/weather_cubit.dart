import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/presentation/cubit/weather_states.dart';
import '../../domain/usecases/weather_useCase.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  final GetWeather getWeatherUseCase;

  WeatherCubit(this.getWeatherUseCase) : super(WeatherInitialState());

  void fetchWeather(String cityName) async {
    emit(WeatherLoadingState());
    try {
      final weather = await getWeatherUseCase(cityName);
      emit(WeatherSuccessState(weather));
    } catch (e) {
      emit(WeatherErrorState(e.toString()));
    }
  }
}

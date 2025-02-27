import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/presentation/cubit/weather_states.dart';
import '../../domain/usecases/ml_usecase.dart';
import '../../domain/usecases/weather_useCase.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  final GetWeather getWeatherUseCase;
  final GetPredictionUseCase getPredictionUseCase;

  WeatherCubit(this.getWeatherUseCase, this.getPredictionUseCase) : super(WeatherInitialState());

  void fetchWeather(String cityName) async {
    emit(WeatherLoadingState());
    try {
      final weather = await getWeatherUseCase(cityName);
      List<int> features = weather.toFeatureArray();
      print('Features: $features');
      final prediction = await getPredictionUseCase(features);
      print("############################################");
      print(prediction);
      emit(WeatherSuccessState(weather, prediction));
    } catch (e) {
      print(e.toString());
      emit(WeatherErrorState(e.toString()));
    }
  }

}

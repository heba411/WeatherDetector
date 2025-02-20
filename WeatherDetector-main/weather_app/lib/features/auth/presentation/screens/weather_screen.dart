import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/components/components.dart';
import 'package:weather_app/core/style/colors.dart';
import 'package:weather_app/features/auth/presentation/cubit/weather_states.dart';
import '../cubit/weather_cubit.dart';
import '../widgets/weather_display.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      // appBar: AppBar(title: Text("Weather Detector"),
      //   backgroundColor: PRIMARY_COLOR,
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: defaultTextFormField(control: cityController,
                    prefIcon: Icons.location_city_outlined,
                    label: "Enter your destination",
                    validate: (value){
                      if(value!.isEmpty)
                      {
                        return 'Enter your destination';
                      }
                      return null;
                    },
                    textInputType: TextInputType.text),
              ),
              SizedBox(height: 10),
              defaultButton(
                color: Colors.white,
                  txtColor: PRIMARY_COLOR,
                  function: () {
                final cityName = cityController.text.trim();
                if (cityName.isNotEmpty) {
                  context.read<WeatherCubit>().getWeatherData(cityName);
                }
              }, text: 'Display Weather'),
              SizedBox(height: 20),
              BlocBuilder<WeatherCubit, WeatherStates>(
                builder: (context, state) {
                  if (state is WeatherLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is WeatherSuccessState) {
                    return WeatherDisplay(weather: state.weather);
                  } else if (state is WeatherErrorState) {
                    return Center(child: Text(state.message, style: TextStyle(color: Colors.red)));
                  } else {
                    return Center(child: Text(""));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

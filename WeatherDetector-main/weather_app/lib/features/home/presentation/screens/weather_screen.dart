import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/components/components.dart';
import 'package:weather_app/core/style/colors.dart';
import '../cubit/weather_cubit.dart';
import '../widgets/weather_display.dart';

class WeatherScreen extends StatelessWidget {
  final TextEditingController cityController = TextEditingController();

  WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          children: [
            SizedBox(height: screenWidth * 0.08,),
            defaultTextFormField(
                control: cityController,
                prefIcon: Icons.location_city_outlined,
                label: 'Enter your destination',
                validate: (value){
                  if(value!.isEmpty)
                  {
                    return 'Enter a city name';
                  }
                  return null;
                },
                textInputType: TextInputType.text),
            SizedBox(height: screenWidth * 0.025,),
            defaultButton(
              color: Colors.white,
                txtColor: PRIMARY_COLOR,
                function: () {
              context.read<WeatherCubit>().fetchWeather(cityController.text);
            },
                text: 'Display Weather'),
            Expanded(
              child: BlocBuilder<WeatherCubit, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is WeatherLoaded) {
                    return WeatherWidget(weather: state.weather);
                  } else if (state is WeatherError) {
                    return Center(child: Text(state.message));
                  }
                  return Center(child: Text("Enter a city"));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

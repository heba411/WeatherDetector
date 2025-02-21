import 'package:flutter/material.dart';
import 'package:weather_app/core/components/components.dart';
import 'package:weather_app/features/auth/presentation/screens/login_screen.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image(
            image: AssetImage('assets/images/sky.jpg'),
          height: screenHeight,
          width: screenWidth,
          fit: BoxFit.cover,
        ),
          Padding(
            padding:  EdgeInsets.all(screenWidth * 0.02),
            child: defaultButton(function: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreen(),));
            }, text: 'Get started'),
          ),
    ]
      ),
    );
  }
}

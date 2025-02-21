import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/core/helper/bloc_observer.dart';
import 'package:weather_app/core/helper/cashe.dart';
import 'package:weather_app/core/helper/dio.dart';
import 'package:weather_app/features/auth/data/repo_implementation/auth_repo_implement.dart';
import 'package:weather_app/features/auth/domain/repos/auth_repo.dart';
import 'package:weather_app/features/auth/domain/usecases/signup_usecase.dart';
import 'package:weather_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:weather_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:weather_app/features/auth/presentation/screens/start_screen.dart';
import 'features/home/data/repo_implementation/weather_repo_implementation.dart';
import 'features/home/domain/repos/weather_repo.dart';
import 'features/home/domain/usecases/weather_useCase.dart';
import 'features/home/presentation/cubit/weather_cubit.dart';
import 'features/home/presentation/screens/weather_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  final dio = Dio();
  final weatherRepository = WeatherRepositoryImpl(dio: dio);
  final getWeather = GetWeather(weatherRepository);

  runApp(
    MultiBlocProvider(
      providers: [
        Provider<AuthRepository>(
          create: (_) => AuthRepositoryImpl(
            firebaseAuth: FirebaseAuth.instance,
            firestore: FirebaseFirestore.instance,
          ),
        ),
        Provider<SignUpUseCase>(
          create: (context) => SignUpUseCase(context.read<AuthRepository>()),
        ),
        Provider<LoginUseCase>(
          create: (context) => LoginUseCase(context.read<AuthRepository>()),
        ),
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(
            context.read<SignUpUseCase>(),
            context.read<LoginUseCase>(),
          ),
        ),
        Provider<WeatherRepository>(
          create: (_) => WeatherRepositoryImpl(dio: dio), // Ensure this exists
        ),
        Provider<GetWeather>(
          create: (context) => GetWeather(context.read<WeatherRepository>()),
        ),
        BlocProvider<WeatherCubit>(
          create: (context) => WeatherCubit(context.read<GetWeather>()),
        ),
        // BlocProvider<WeatherCubit>(
        //   create: (context) => WeatherCubit(getWeather),
        // ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartScreen(),
    );
  }
}

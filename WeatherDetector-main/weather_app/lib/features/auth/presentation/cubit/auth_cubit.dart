import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/auth/domain/entities/user.dart';
import 'package:weather_app/features/auth/domain/usecases/signup_usecase.dart';
import 'package:weather_app/features/auth/presentation/cubit/auth_states.dart';
import '../../domain/usecases/login_usecase.dart';

class AuthCubit extends Cubit<AuthStates> {
  final LoginUseCase loginUseCase;
  final SignUpUseCase signUpUseCase;

  AuthCubit(this.signUpUseCase, this.loginUseCase) : super(AuthInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);

  Future<void> login(String email, String password) async {
    emit(LoginLoadingState());
    final result = await loginUseCase(email: email, password: password);

    result.fold(
      ifLeft: (String error) {
        emit(LoginErrorState(error));
      },
      ifRight: (String userId) {
        emit(LoginSuccessState(userId));
      },
    );
  }

  Future<void> signUp({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    emit(SignUpLoadingState());

    print("🔍 Calling signUpUseCase...");
    final result = await signUpUseCase(
      name: name,
      email: email,
      phone: phone,
      password: password,
    );


    result.fold(
      ifLeft: (error) {
        emit(SignUpErrorState(error));
      },
      ifRight: (user) async {
        await Future.delayed(Duration(milliseconds: 500)); // Prevent UI glitches
        emit(SignUpSuccessState(user));
      },
    );
  }


  bool isPasswordHidden = true;
  IconData passwordIcon = Icons.visibility_outlined;

  void togglePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    passwordIcon = isPasswordHidden ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(AuthPassVisibilityToggledState());
  }
}

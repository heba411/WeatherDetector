import 'package:weather_app/features/auth/domain/entities/user.dart';

abstract class AuthStates{}
class AuthInitialState extends AuthStates{}

class LoginLoadingState extends AuthStates {}
class SignUpLoadingState extends AuthStates {}
class LoginSuccessState extends AuthStates {
  final String uId;
  LoginSuccessState(this.uId);
}
class SignUpSuccessState extends AuthStates {
  final UserEntity user;
  SignUpSuccessState(this.user);
}
class LoginErrorState extends AuthStates {
  final String error;
  LoginErrorState(this.error);
}
class SignUpErrorState extends AuthStates {
  final String error;
  SignUpErrorState(this.error);
}
class LoginChangePassIconState extends AuthStates{}
class AuthPassVisibilityToggledState extends AuthStates{}
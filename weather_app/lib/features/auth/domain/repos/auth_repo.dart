import 'package:dart_either/dart_either.dart';
import 'package:weather_app/features/auth/data/models/user_model.dart';

abstract class AuthRepository {
  Future<Either<String, String>> login({required String email, required String password});
  Future<Either<String, UserModel>> signUp({
    required String name,
    required String email,
    required String phone,
    required String password,
  });}
import 'package:weather_app/features/auth/data/models/user_model.dart';
import 'package:weather_app/features/auth/domain/entities/user.dart';
import 'package:weather_app/features/auth/domain/repos/auth_repo.dart';
import 'package:dart_either/dart_either.dart';


class SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  Future<Either<String, UserModel>> call({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    return await repository.signUp(name: name, email: email, phone: phone, password: password);
  }
}

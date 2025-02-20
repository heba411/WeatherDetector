import 'package:dart_either/dart_either.dart';

import '../repos/auth_repo.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<Either<String, String>> call({required String email, required String password}) async {
    return await repository.login(email: email, password: password);
  }
}
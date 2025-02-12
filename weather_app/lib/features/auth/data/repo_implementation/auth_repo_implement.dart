import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dart_either/dart_either.dart';
import 'package:weather_app/features/auth/data/models/user_model.dart';
import '../../domain/repos/auth_repo.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  AuthRepositoryImpl({
    required this.firebaseAuth,
    required this.firestore,
  });

  @override
  Future<Either<String, String>> login({required String email, required String password}) async {
    try {
      UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return Right(userCredential.user!.uid);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, UserModel>> signUp({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {

    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );


      final user = UserModel(
        uid: userCredential.user!.uid,
        name: name,
        email: email,
        phone: phone,
      );

      await firestore.collection("users").doc(user.uid).set(user.toMap());

      return Either.right(user);
    } catch (e) {
      return Either.left(e.toString());
    }
  }


}

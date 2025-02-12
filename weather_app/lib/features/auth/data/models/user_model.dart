import '../../domain/entities/user.dart';

class UserModel extends UserEntity {
  UserModel({
    required String uid,
    required String name,
    required String email,
    required String phone,
  }) : super(uid: uid, name: name, email: email, phone: phone);

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
    };
  }
}

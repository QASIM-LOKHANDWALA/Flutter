import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({required super.id, required super.email, required super.name});

  factory UserModel.fromJsom(Map<String,dynamic> map) {
    return UserModel(id: map['id'] ?? '', email: map['email'] ?? '', name: map['name'] ?? '');
  }
}

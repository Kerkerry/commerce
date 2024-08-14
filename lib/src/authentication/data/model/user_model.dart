import 'dart:convert';

import '../../../../core/typedef/typedef.dart';
import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel(
      {required super.id,
      required super.userName,
      required super.email,
      required super.password});

  UserModel.fromMap(DataMap map)
      : this(
            id: map['user_id'],
            userName: map['username'],
            email: map['email'],
            password: map['password']);

  factory UserModel.fromJson(String json) =>
      UserModel.fromMap(jsonDecode(json) as DataMap);

  UserModel copyWith(
      {int? id, String? userName, String? email, String? password}) {
    return UserModel(
        id: id ?? this.id,
        userName: userName ?? this.userName,
        email: email ?? this.email,
        password: password ?? this.password);
  }

  DataMap toMap() {
    return {
      'id': id,
      'username': userName,
      'email': email,
      'password': password
    };
  }

  String toJsion() => jsonEncode(toMap());
}

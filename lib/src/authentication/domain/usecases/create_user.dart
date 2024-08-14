import 'package:equatable/equatable.dart';

import '../../../../core/typedef/typedef.dart';
import '../../../../core/usecases/usecases.dart';
import '../repositories/user_repository.dart';

class CreateUser extends UseCaseWithParams<void, UserParams> {
  CreateUser(this._repository);
  final UserRepository _repository;

  @override
  ResultFuture<void> call(UserParams params) async => _repository.createUser(
      username: params.userName,
      email: params.email,
      password: params.password);
}

class UserParams extends Equatable {
  const UserParams(
      {required this.userName, required this.email, required this.password});
  final String userName;
  final String email;
  final String password;

  @override
  List<Object?> get props => [userName, email, password];
}

import 'package:dartz/dartz.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/typedef/typedef.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasource/user_remote_datasource.dart';

class UserRepositoryImplementation implements UserRepository {
  const UserRepositoryImplementation(this._datasource);
  final UserRemoteDataSource _datasource;

  @override
  ResultVoid createUser(
      {required String username,
      required String email,
      required String password}) async {
    try {
      await _datasource.createUser(
          userName: username, email: email, password: password);
      return const Right(null);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultVoid deleteUser({required int id}) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  ResultFuture<List<User>> getUsers() async {
    try {
      final result = await _datasource.getUsers();
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultVoid updateUser({required int id, required User user}) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}

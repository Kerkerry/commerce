import '../../../../core/typedef/typedef.dart';
import '../entities/user.dart';

abstract class UserRepository {
  const UserRepository();

  ResultVoid createUser(
      {required String username,
      required String email,
      required String password});

  ResultFuture<List<User>> getUsers();

  ResultVoid updateUser({required int id, required User user});

  ResultVoid deleteUser({required int id});
}

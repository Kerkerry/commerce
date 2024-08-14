import '../model/user_model.dart';

abstract class UserRemoteDataSource {
  const UserRemoteDataSource();

  Future<void> createUser(
      {required String userName,
      required String email,
      required String password});

  Future<List<UserModel>> getUsers();
}

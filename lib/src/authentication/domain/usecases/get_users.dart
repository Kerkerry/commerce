import '../../../../core/typedef/typedef.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

class GetUsers extends UseCaseWithoutParams<List<User>> {
  const GetUsers(this._repository);

  final UserRepository _repository;

  @override
  ResultFuture<List<User>> call() async => _repository.getUsers();
}

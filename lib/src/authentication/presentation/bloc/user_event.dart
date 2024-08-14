part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class CreateUserEvent extends UserEvent{
  final String username;
  final String email;
  final String password;
  const CreateUserEvent({required this.username, required this.email, required this.password});
}

class GetUsersEvent extends UserEvent{
  const GetUsersEvent();
}

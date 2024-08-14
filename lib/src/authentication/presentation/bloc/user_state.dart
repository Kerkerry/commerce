part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();
  
  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

class UserCreatingState extends UserState{
  const UserCreatingState();
}

class UserCreatedstate extends UserState{
  const UserCreatedstate();
}

class UserLoadingstate extends UserState{
  const UserLoadingstate();
}

class UserLoadedState extends UserState{
  final List<User> users;
  const UserLoadedState(this.users);

  @override
  List<Object> get props => users.map((user) => user.id).toList();
}

class UserErrorState extends UserState{
  final String message;
  const UserErrorState(this.message);

  @override
  List<Object> get props => [message];
}
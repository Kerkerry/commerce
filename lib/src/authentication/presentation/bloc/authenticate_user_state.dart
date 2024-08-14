part of 'authenticate_user_bloc.dart';

sealed class AuthenticateUserState extends Equatable {
  const AuthenticateUserState();

  @override
  List<Object> get props => [];
}

final class AuthenticateUserInitial extends AuthenticateUserState {}

class LoggingInUserState extends AuthenticateUserState {
  const LoggingInUserState();
}

class UserLoggedInState extends AuthenticateUserState {
  final User user;
  const UserLoggedInState(this.user);
  @override
  List<Object> get props => [user.id, user.email, user.email, user.password];
}

class LoginUserErrorState extends AuthenticateUserState {
  final String message;
  const LoginUserErrorState(this.message);

  @override
  List<Object> get props => [message];
}

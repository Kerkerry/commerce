part of 'authenticate_user_bloc.dart';

sealed class AuthenticateUserEvent extends Equatable {
  const AuthenticateUserEvent();

  @override
  List<Object> get props => [];
}

class LoginUserEvent extends AuthenticateUserEvent{
  const LoginUserEvent({required this.email,required this.password});
  final String email;
  final String password;

   @override
  List<Object> get props => [email,password];
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/user.dart';
import '../../domain/usecases/get_users.dart';

part 'authenticate_user_event.dart';
part 'authenticate_user_state.dart';

class AuthenticateUserBloc
    extends Bloc<AuthenticateUserEvent, AuthenticateUserState> {
  final GetUsers _getUsers;
  AuthenticateUserBloc({required GetUsers getUsers})
      : _getUsers = getUsers,
        super(AuthenticateUserInitial()) {
    on<LoginUserEvent>(_loginUserEventHandler);
  }

  FutureOr<void> _loginUserEventHandler(
      LoginUserEvent event, Emitter<AuthenticateUserState> emit) async {
    emit(const LoggingInUserState());
    final result = await _getUsers();

    result.fold((failure) => emit(LoginUserErrorState(failure.message)),
        (users) {
      final int userFound = users.indexWhere((user) =>
          user.email == event.email && user.password == event.password);

      if (userFound != -1) {
        emit(UserLoggedInState(users[userFound]));
      } else {
        emit(const LoginUserErrorState("Wrong email or password"));
      }
    });
  }
}

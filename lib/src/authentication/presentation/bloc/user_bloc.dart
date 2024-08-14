import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/user.dart';
import '../../domain/usecases/create_user.dart';
import '../../domain/usecases/get_users.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUsers _getUsers;
  final CreateUser _createUser;
  UserBloc({required CreateUser createUser, required GetUsers getUsers})
      : _createUser = createUser,
        _getUsers = getUsers,
        super(UserInitial()) {
    on<CreateUserEvent>(_createUserHandler);
    on<GetUsersEvent>(_getUsersHandler);
  }

  FutureOr<void> _createUserHandler(
      CreateUserEvent event, Emitter<UserState> emit) async {
    emit(const UserCreatingState());
    final result = await _createUser(UserParams(
        userName: event.username,
        email: event.email,
        password: event.password));

    result.fold((failure) => emit(UserErrorState(failure.message)),
        (_) => emit(const UserCreatedstate()));
  }

  FutureOr<void> _getUsersHandler(
      GetUsersEvent event, Emitter<UserState> emit) async {
    emit(const UserLoadingstate());
    final result = await _getUsers();

    result.fold((failure) => emit(UserErrorState(failure.message)),
        (users) => emit(UserLoadedState(users)));
  }
}

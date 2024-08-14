import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../products/presentation/widgets/loading_column.dart';
import '../../domain/entities/user.dart';
import '../bloc/user_bloc.dart';
import '../widgets/user_card.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  void getUsers() {
    context.read<UserBloc>().add(const GetUsersEvent());
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: const Text("Users"),
              centerTitle: true,
            ),
            body: state is UserLoadingstate
                ? const LoadingColumn(message: "Fetching users..")
                : state is UserLoadedState
                    ? ListView.builder(
                        itemCount: state.users.length,
                        itemBuilder: (context, index) {
                          final User user = state.users[index];
                          return UserCard(user: user);
                        })
                    : state is UserErrorState
                        ? Center(
                            child: Text(state.message),
                          )
                        : const SizedBox.shrink());
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../products/presentation/screens/home_screen.dart';
import '../../../products/presentation/widgets/loading_column.dart';
import '../bloc/authenticate_user_bloc.dart';

class LoginUserScreen extends StatelessWidget {
  LoginUserScreen({super.key});

  final email = TextEditingController();

  final password = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocConsumer<AuthenticateUserBloc, AuthenticateUserState>(
        listener: (context, state) {
          if (state is LoginUserErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }

          if (state is UserLoggedInState) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HomeScreen(
                      user: state.user,
                    )));
          }
        },
        builder: (context, state) {
          if (state is AuthenticateUserInitial) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: size.width,
                            height: size.height * 0.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                    image: AssetImage(
                                        "assets/images/ecommerce.jpg"),
                                    fit: BoxFit.cover)),
                            // child:const Image(image: AssetImage("assets/images/ecommerce.jpeg")),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            style: TextStyle(
                                fontSize: 18,
                                letterSpacing: 2,
                                color: Colors.black.withOpacity(0.7)),
                            controller: email,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Enter email",
                                labelStyle: TextStyle(fontSize: 18)),
                            validator: (value) {
                              if (value == null && value!.isEmpty) {
                                return "Email is required";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            style: TextStyle(
                                fontSize: 18,
                                letterSpacing: 2,
                                color: Colors.black.withOpacity(0.7)),
                            controller: password,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Enter password",
                                labelStyle: TextStyle(fontSize: 18)),
                            validator: (value) {
                              if (value == null && value!.isEmpty) {
                                return "Password is required";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                  shape: const MaterialStatePropertyAll(
                                      BeveledRectangleBorder()),
                                  backgroundColor: MaterialStatePropertyAll(
                                      Colors.amber[700])),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  context.read<AuthenticateUserBloc>().add(
                                      LoginUserEvent(
                                          email: email.text.trim(),
                                          password: password.text.trim()));
                                }
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: 20,
                                      letterSpacing: 2,
                                      color: Colors.white),
                                ),
                              ))
                        ],
                      ),
                    )),
              ),
            );
          } else if (state is LoggingInUserState) {
            return const LoadingColumn(message: "Logging in user");
          } else if (state is LoginUserErrorState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.dangerous_outlined,
                    size: 40,
                    color: Colors.red,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    state.message,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.arrow_back))
                ],
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/service/injection_container.dart';
import 'src/authentication/presentation/bloc/authenticate_user_bloc.dart';
import 'src/authentication/presentation/bloc/user_bloc.dart';
import 'src/authentication/presentation/screens/login_user_screen.dart';
import 'src/orders/presentation/bloc/orders_bloc.dart';
import 'src/products/presentation/bloc/prouduct_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<AuthenticateUserBloc>()),
        BlocProvider(create: (context) => sl<UserBloc>()),
        BlocProvider(create: (context) => sl<ProuductBloc>()),
        BlocProvider(create: (context) => sl<OrdersBloc>())
      ],
      child: MaterialApp(
        title: 'Commerce',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: LoginUserScreen(),
      ),
    );
  }
}

import 'package:gulit/bloc/cart_bloc/cart_bloc.dart';
import 'package:gulit/bloc/home_bloc/home_bloc.dart';
import 'package:gulit/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:gulit/views/app_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Guilt',
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => NavigationBloc()..add(AppStarted()),
            ),
            BlocProvider(
              create: (context) => HomeBloc()..add(GetGroceries()),
            ),
            BlocProvider(
              create: (context) => CartBloc()..add(GetCartItems()),
              child: Container(),
            )
          ],
          child: AppScreen(),
        ));
  }
}

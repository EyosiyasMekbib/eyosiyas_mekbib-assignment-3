import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gulit/bloc/cart_bloc/cart_bloc.dart';
import 'package:gulit/bloc/home_bloc/home_bloc.dart';
import 'package:gulit/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:gulit/views/home/home_screen.dart';
import 'package:gulit/views/cart/cart_screen.dart';
import 'package:gulit/views/profile/profile_screen.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/logo.png', scale: 3),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                Color(0xffA1FF68),
                Color.fromARGB(0, 255, 255, 255)
              ])),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          if (state is PageLoading) {
            return Center(
                child: CircularProgressIndicator(
              color: Colors.green,
            ));
          }
          if (state is HomePageLoaded) {
            return Home();
          }
          if (state is ProfilePageLoaded) {
            return Profile();
          }
          if (state is CartPageLoaded) {
            return Cart();
          }
          return Container();
        },
      ),
      bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          return ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0)),
            child: BottomNavigationBar(
              currentIndex:
                  context.select((NavigationBloc bloc) => bloc.currentIndex),
              unselectedItemColor: Colors.white,
              selectedItemColor: Color(0xff9AFF5D),
              elevation: 0,
              backgroundColor: Color.fromARGB(255, 27, 27, 27),
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Profile'),
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_bag), label: 'Cart'),
              ],
              onTap: (index) => context
                  .read<NavigationBloc>()
                  .add(ClickedPageButton(index: index)),
            ),
          );
        },
      ),
    ));
    ;
  }
}

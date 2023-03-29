import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gulit/bloc/cart_bloc/cart_bloc.dart';
import 'package:gulit/bloc/home_bloc/home_bloc.dart';
import 'package:gulit/model/GroceryItem.dart';
import 'package:gulit/views/home/grocery_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      decoration: BoxDecoration(color: Color.fromARGB(255, 240, 240, 240)),
      padding: EdgeInsets.fromLTRB(35, 0, 35, 0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              'Hello Seleshi',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            )),
        Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Text(
            'Its Time To Shop',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ),
        BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              );
            }
            if (state is HomeSuccessState) {
              return Expanded(
                child: MasonryGridView.count(
                    crossAxisCount: 2,
                    itemCount: state.groceryItem.length,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    itemBuilder: ((context, index) {
                      GroceryItem grocery = state.groceryItem[index];
                      return GroceryCard(groceryItem: grocery);
                    })),
              );
            }

            if (state is HomeFailedState) {
              return Center(
                child: ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<HomeBloc>(context).add(GetGroceries());
                    },
                    child: Icon(Icons.replay_outlined)),
              );
            }
            return Container();
          },
        )
      ]),
    );
  }
}

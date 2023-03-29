import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gulit/bloc/cart_bloc/cart_bloc.dart';
import 'package:gulit/views/cart/cart_card.dart';

class Cart extends StatefulWidget {
  num totalPrice = 0;

  Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    num price = 0;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      decoration: BoxDecoration(color: Color.fromARGB(255, 240, 240, 240)),
      padding: const EdgeInsets.only(left: 35, right: 35, top: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cart',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    if (state is CartLoading) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.green,
                        ),
                      );
                    }

                    if (state is CartLoaded) {
                      if (state.cartItems.isEmpty) {
                        return Text('You Have an Empty Cart');
                      }

                      void _incrementCounter() {
                        for (var element in state.cartItems) {
                          this.widget.totalPrice += element.getPrice();
                        }
                      }

                      _incrementCounter();

                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20, top: 20),
                            child: Row(
                              children: [
                                Text(
                                  'Total Price: ',
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.grey),
                                ),
                                Text(
                                  '${this.widget.totalPrice}\$',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 500,
                            child: ListView.builder(
                              itemCount: state.cartItems.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: CartCard(
                                    cartItem: state.cartItems[index],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

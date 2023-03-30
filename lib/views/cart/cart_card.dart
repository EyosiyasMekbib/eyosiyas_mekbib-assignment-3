import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gulit/bloc/cart_bloc/cart_bloc.dart';
import 'package:gulit/model/CartItem.dart';
import 'package:gulit/model/GroceryItem.dart';

class CartCard extends StatelessWidget {
  GroceryItem cartItem;

  CartCard({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    num price = this.cartItem.unit_price;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 90,
              child: Image(image: NetworkImage(cartItem.imageUrl)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.red,
                        padding: EdgeInsets.zero,
                        minimumSize: Size(20, 5),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        alignment: Alignment.topRight),
                    onPressed: () {
                      BlocProvider.of<CartBloc>(context)
                          .add(RemoveFromCart(groceryItem: cartItem));
                    },
                    child: Text('X')),
                Text(
                  this.cartItem.name,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text('${cartItem.quantity} X '),
                    Text(
                      '\$$price',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

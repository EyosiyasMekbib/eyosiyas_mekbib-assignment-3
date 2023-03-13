import 'package:flutter/material.dart';
import 'package:gulit/model/CartItem.dart';
import 'package:gulit/model/GroceryItem.dart';

class CartCard extends StatelessWidget {
  GroceryItem cartItem;

  CartCard({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    num price = this.cartItem.price;
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
                Text(
                  this.cartItem.name,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$$price',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

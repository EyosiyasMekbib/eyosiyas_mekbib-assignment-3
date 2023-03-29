import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gulit/bloc/cart_bloc/cart_bloc.dart';
import 'package:gulit/model/GroceryItem.dart';

class GroceryCard extends StatelessWidget {
  GroceryItem groceryItem;

  GroceryCard({super.key, required this.groceryItem});

  @override
  Widget build(BuildContext context) {
    num price = this.groceryItem.unit_price;
    return Container(
      padding: EdgeInsets.only(left: 0, top: 0, bottom: 12),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: NetworkImage(this.groceryItem.imageUrl),
              fit: BoxFit.fitWidth,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 8, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    this.groceryItem.name.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    '\$$price',
                    style: TextStyle(fontSize: 10),
                  )
                ],
              ),
            ),
            ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStatePropertyAll<double>(0.0),
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Color(0xffFFAA2B)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(8)))),
                ),
                onPressed: () {
                  BlocProvider.of<CartBloc>(context)
                      .add(AddToCart(groceryItem: this.groceryItem));
                },
                child: Icon(Icons.shopping_cart)),
          ],
        ),
      ),
    );
  }
}

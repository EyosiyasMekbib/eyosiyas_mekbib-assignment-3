import 'package:equatable/equatable.dart';
import 'package:gulit/model/GroceryItem.dart';

class CartItems extends Equatable {
  final List<GroceryItem> groceryItems;

  const CartItems({this.groceryItems = const <GroceryItem>[]});

  @override
  List<Object?> get props => [groceryItems];
}

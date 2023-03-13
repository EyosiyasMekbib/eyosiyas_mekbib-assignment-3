part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddToCart extends CartEvent {
  final GroceryItem groceryItem;

  const AddToCart({required this.groceryItem});

  @override
  List<Object> get props => [];

  get data => groceryItem;
}

class GetCartItems extends CartEvent {
  @override
  List<Object> get props => [];
}

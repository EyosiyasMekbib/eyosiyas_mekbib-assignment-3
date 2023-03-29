import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gulit/model/GroceryItem.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  List cartItems = [];

  CartBloc() : super(CartInitial()) {
    on<GetCartItems>(
      (event, emit) {
        emit(CartLoaded(cartItems));
      },
    );

    on<AddToCart>((event, emit) {
      if (cartItems.isNotEmpty && cartItems.contains(event.groceryItem)) {
        for (var item in cartItems) {
          if (event.groceryItem == item) {
            item.incrementQuantity();
          }
        }
      } else {
        cartItems.add(event.groceryItem);
      }
      // cartItems.add(event.groceryItem);
      emit(CartLoaded(cartItems));
      // TODO: implement event handler
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gulit/model/GroceryItem.dart';
import 'package:gulit/service/localDbService.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final _service = Service();
  List cartItems = [];

  CartBloc() : super(CartInitial()) {
    getCartItems() async {
      final groceries = await _service.readGrocery();
      cartItems.clear();
      for (var i in groceries) {
        cartItems.add(GroceryItem.fromJson(i));
      }
    }

    on<GetCartItems>(
      (event, emit) async {
        emit(CartLoading());

        // _service.deleteAllGroceries();
        await getCartItems();
        emit(CartLoaded(cartItems));
      },
    );

    on<AddToCart>((event, emit) async {
      emit(CartLoading());

      if (cartItems.isNotEmpty && cartItems.contains(event.groceryItem)) {
        for (var item in cartItems) {
          if (event.groceryItem == item) {
            item.incrementQuantity();
            await _service.updateGrocery(item);
          }
        }
      } else {
        await _service.saveGrocery(event.groceryItem);
      }

      GetCartItems();
    });

    on<RemoveFromCart>((event, emit) async {
      emit(CartLoading());
      await _service.deleteGrocery(event.groceryItem.id);

      GetCartItems();
    });
  }
}

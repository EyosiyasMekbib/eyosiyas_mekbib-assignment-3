part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {
  @override
  List<Object> get props => [];
}

class CartLoaded extends CartState {
  final List cartItems;

  CartLoaded(this.cartItems);

  @override
  List<Object> get props => [];
}

class CartError extends CartState {
  @override
  List<Object> get props => [];
}

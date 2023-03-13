part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeSuccessState extends HomeState {
  final List<GroceryItem> groceryItem;

  HomeSuccessState(this.groceryItem);

  @override
  List<Object> get props => [];
}

class HomeFailedState extends HomeState {
  @override
  List<Object> get props => [];
}

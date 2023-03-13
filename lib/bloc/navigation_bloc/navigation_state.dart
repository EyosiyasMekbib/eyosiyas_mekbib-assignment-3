part of 'navigation_bloc.dart';

abstract class NavigationState extends Equatable {
  const NavigationState();

  @override
  List<Object> get props => [];
}

class CurrentIndexChanged extends NavigationState {
  final int currentIndex;

  CurrentIndexChanged({required this.currentIndex});

  @override
  List<Object> get props => [];
}

class PageLoading extends NavigationState {
  @override
  List<Object> get props => [];
}

class HomePageLoaded extends NavigationState {
  @override
  List<Object> get props => [];
}

class CartPageLoaded extends NavigationState {
  @override
  List<Object> get props => [];
}

class ProfilePageLoaded extends NavigationState {
  @override
  List<Object> get props => [];
}

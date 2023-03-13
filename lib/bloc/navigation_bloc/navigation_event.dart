part of 'navigation_bloc.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends NavigationEvent {
  @override
  List<Object> get props => [];
}

class ClickedPageButton extends NavigationEvent {
  final int index;

  ClickedPageButton({required this.index});

  @override
  List<Object> get props => [];
}

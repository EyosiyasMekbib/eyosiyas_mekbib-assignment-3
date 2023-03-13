import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  int currentIndex = 1;

  NavigationBloc() : super(HomePageLoaded()) {
    on<AppStarted>((event, emit) {
      ClickedPageButton(index: currentIndex);
    });

    on<ClickedPageButton>((event, emit) {
      currentIndex = event.index;

      emit(CurrentIndexChanged(currentIndex: this.currentIndex));
      emit(PageLoading());

      if (this.currentIndex == 0) {
        emit(ProfilePageLoaded());
      }
      if (this.currentIndex == 1) {
        emit(HomePageLoaded());
      }
      if (this.currentIndex == 2) {
        emit(CartPageLoaded());
      }
    });
  }
}

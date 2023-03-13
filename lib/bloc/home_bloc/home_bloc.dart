import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gulit/model/GroceryItem.dart';
import 'package:gulit/service/apiService.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _apiServiceProvider = ApiServiceProvider();

  HomeBloc() : super(HomeInitial()) {
    on<InitiateGroceries>((event, emit) {
      GetGroceries();
    });

    on<GetGroceries>((event, emit) async {
      emit(HomeLoadingState());
      try {
        final groceries = await _apiServiceProvider.fetchGroceries();
        emit(HomeSuccessState(groceries));
      } catch (e) {
        emit(HomeFailedState());
      }
    });
  }
}

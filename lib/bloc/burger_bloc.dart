// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:blocapp/model/burger_model.dart';
import 'package:equatable/equatable.dart';

part 'burger_event.dart';
part 'burger_state.dart';

class BurgerBloc extends Bloc<BurgerEvent, BurgerState> {
  BurgerBloc() : super(BurgerInitial()) {
    on<LoadBurgerCounter>((event, emit) async {
      await Future.delayed(const Duration(seconds: 2));
      emit(const BurgerLoaded(burgers: <Burger>[]));
    });
    on<AddBurger>((event, emit) {
      if (state is BurgerLoaded) {
        final state = this.state as BurgerLoaded;
        emit(
            BurgerLoaded(burgers: List.from(state.burgers)..add(event.burger)));
      }
    });
    on<Removeburger>((event, emit) {
      if (state is BurgerLoaded) {
        final state = this.state as BurgerLoaded;
        emit(BurgerLoaded(burgers: List.from(state.burgers)..remove(event.burger)));
      }
    });
  }
}

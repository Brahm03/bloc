import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'burger_event.dart';
part 'burger_state.dart';

class BurgerBloc extends Bloc<BurgerEvent, BurgerState> {
  BurgerBloc() : super(BurgerInitial()) {
    on<BurgerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

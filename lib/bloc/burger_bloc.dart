import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:blocapp/model/burger_model.dart';
import 'package:equatable/equatable.dart';

part 'burger_event.dart';
part 'burger_state.dart';

class BurgerBloc extends Bloc<BurgerEvent, BurgerState> {
  BurgerBloc() : super(BurgerInitial()) {
    on<LoadBurgerCounter>((event, emit) {});
    on<AddBurger>((event, emit) {});
    on<Removeburger>((event, emit) {});
  }
}

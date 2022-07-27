part of 'burger_bloc.dart';

abstract class BurgerEvent extends Equatable {
  const BurgerEvent();

  @override
  List<Object> get props => [];
}

class LoadBurgerCounter extends BurgerEvent {}

class AddBurger extends BurgerEvent {
  final List<Burger> burgers;

  const AddBurger({required this.burgers});

  @override
  List<Object> get props => [burgers];
}

class Removeburger extends BurgerEvent {
  final List<Burger> burgers;

  const Removeburger({required this.burgers});

  @override
  List<Object> get props => [burgers];
}

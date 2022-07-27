part of 'burger_bloc.dart';

abstract class BurgerEvent extends Equatable {
  const BurgerEvent();

  @override
  List<Object> get props => [];
}

class LoadBurgerCounter extends BurgerEvent {}

class AddBurger extends BurgerEvent {
  final Burger burger;

  const AddBurger({required this.burger});

  @override
  List<Object> get props => [burger];
}

class Removeburger extends BurgerEvent {
  final Burger burger;
  const Removeburger({required this.burger});

  @override
  List<Object> get props => [burger];
}

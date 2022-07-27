part of 'burger_bloc.dart';

abstract class BurgerState extends Equatable {
  const BurgerState();

  @override
  List<Object> get props => [];
}

class BurgerInitial extends BurgerState {}

class BurgerLoaded extends BurgerState {
  final List<Burger> burgers;

  const BurgerLoaded({required this.burgers});

  @override
  List<Object> get props => [burgers];
}

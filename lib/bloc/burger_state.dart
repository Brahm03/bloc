part of 'burger_bloc.dart';

abstract class BurgerState extends Equatable {
  const BurgerState();
  
  @override
  List<Object> get props => [];
}

class BurgerInitial extends BurgerState {}

import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class Burger extends Equatable {
  final String id;
  final String name;
  final Image pic;

  const Burger({required this.id, required this.name, required this.pic});

  @override
  List<Object?> get props => [id, name, pic];

  static List<Burger> burgers = [
    Burger(
        id: '0',
        name: 'CheesBurger',
        pic: Image.asset('assets/images/burger.png')),
    Burger(
        id: '1',
        name: 'BlackBurger',
        pic: Image.asset('assets/images/blackburger.png'))
  ];
}

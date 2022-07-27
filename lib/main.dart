import 'dart:math';

import 'package:blocapp/bloc/burger_bloc.dart';
import 'package:blocapp/model/burger_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => BurgerBloc()..add(LoadBurgerCounter()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bloc app',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text('The Burger Pizza'),
            centerTitle: true,
          ),
          body: Center(
            child:
                BlocBuilder<BurgerBloc, BurgerState>(builder: (context, state) {
              if (state is BurgerInitial) {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              } else if (state is BurgerLoaded) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      state.burgers.length.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 1.5,
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          for (int index = 0;
                              index < state.burgers.length;
                              index++)
                            Positioned(
                               bottom: Random().nextInt(400).toDouble(),
                                top: Random().nextInt(400).toDouble(),
                                left: Random().nextInt(250).toDouble(),
                                right: Random().nextInt(250).toDouble(),
                                child: SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: state.burgers[index].pic,
                                ))
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          FloatingActionButton(
                            backgroundColor: Colors.orange[800],
                            onPressed: () {
                              context
                                  .read<BurgerBloc>()
                                  .add(AddBurger(burger: Burger.burgers[0]));
                            },
                            child: const Icon(Icons.add),
                          ),
                          FloatingActionButton(
                            backgroundColor: Colors.orange[800],
                            onPressed: () {
                              context
                                  .read<BurgerBloc>()
                                  .add(Removeburger(burger: Burger.burgers[0]));
                            },
                            child: const Icon(Icons.remove),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return const SizedBox();
              }
            }),
          ),
        ),
      ),
    );
  }
}

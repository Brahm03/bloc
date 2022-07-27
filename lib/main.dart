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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
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
                        children: [
                          for (int index = 0;
                              index < state.burgers.length;
                              index++)
                            Positioned(
                                child: SizedBox(
                              height: 150,
                              width: 150,
                              child: state.burgers[index].pic,
                            ))
                        ],
                      ),
                    )
                  ],
                );
              } else {
                return const SizedBox();
              }
            }),
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.orange[800],
                onPressed: () {
                  context
                      .read<BurgerBloc>()
                      .add(AddBurger(burger: Burger.burgers[0]));
                },
                child: const Icon(Icons.food_bank_sharp),
              )
            ],
          ),
        ),
      ),
    );
  }
}

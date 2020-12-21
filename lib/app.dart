import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/cep_bloc.dart';
import 'bloc/validador_bloc.dart';
import 'screens/home.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ValidadorBloc>(
          create: (context) => ValidadorBloc(),
        ),
        BlocProvider<CepBloc>(
          create: (context) => CepBloc(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
        title: 'Pesquisa CEP',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: Home(),
      ),
    );
  }
}



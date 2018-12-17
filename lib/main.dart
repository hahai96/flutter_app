import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/bloc_provider.dart';
import 'package:flutter_app/bloc/drink_catalog_bloc.dart';
import 'package:flutter_app/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider<DrinkCatalogBloc>(
          bloc: DrinkCatalogBloc(),
          child: MyHomePage(title: "Flutter Demo"),
        ));
  }
}

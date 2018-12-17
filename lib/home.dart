import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/bloc_provider.dart';
import 'package:flutter_app/model/drink.dart';
import 'package:flutter_app/bloc/drink_catalog_bloc.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final DrinkCatalogBloc drinkBloc =
        BlocProvider.of<DrinkCatalogBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: StreamBuilder(
            stream: drinkBloc.outDrinks,
            builder: (context, snapshot) {
              List<Drink> drinks = snapshot.data;
              return GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                  children: List.generate(drinks != null ? drinks.length : 0,
                      (index) {
                    return Stack(
                      children: <Widget>[
                        Image.network(drinks[index].image),
                        Positioned(
                            bottom: 0.0,
                            child: Container(
                              height: 40.0,
                              width: 120.0,
                              alignment: Alignment.center,
                              color: Colors.blue,
                              child: FlatButton(
                                  onPressed: () =>
                                      drinkBloc.handleRemoveItem(index),
                                  child: Text('DELETE')),
                            ))
                      ],
                    );
                  }));
            }));
  }
}

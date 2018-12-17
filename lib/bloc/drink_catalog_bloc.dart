import 'dart:async';
import 'dart:collection';
import 'package:flutter_app/bloc/bloc_provider.dart';
import 'package:flutter_app/model/drink.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DrinkCatalogBloc implements BlocBase {
  List<Drink> _drinks = [];

  final StreamController<List<Drink>> _drinkController =
      StreamController<List<Drink>>();

  Sink<List<Drink>> get inDrinks => _drinkController.sink;

  Stream<List<Drink>> get outDrinks => _drinkController.stream;

  DrinkCatalogBloc() {
    _loadData();
  }

  _loadData() async {
    var url =
        "https://www.thecocktaildb.com/api/json/v1/1/filter.php?g=Cocktail_glass";
    await http.get(url).then((response) {
      var extractData = json.decode(response.body);
      List<dynamic> listDrink = extractData['drinks'];
      for (int i = 0; i < listDrink.length; i++) {
        _drinks.add(Drink.fromJson(listDrink[i]));
      }

      inDrinks.add(_drinks);
    });
  }

  void handleRemoveItem(int position) {
    _drinks.removeAt(position);
    inDrinks.add(_drinks);
  }

  @override
  void dispose() {
    _drinkController.close();
  }
}

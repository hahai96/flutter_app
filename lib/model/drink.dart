class Drink {
  String id;
  String location;
  String image;

  Drink(this.id, this.location, this.image);

  Drink.fromJson(Map<String, dynamic> json)
      : id = json['idDrink'],
        location = json['strDrink'],
        image = json['strDrinkThumb'];

  Map<String, dynamic> toJson() =>
      {'idDrink': id, 'strDrink': location, 'strDrinkThumb': image};
}

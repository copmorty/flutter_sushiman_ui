import 'package:decimal/decimal.dart';
import 'package:flutter_sushiman_ui/shared/data/models/ingredient.dart';

class Dish {
  final String name;
  final String picture;
  final Decimal price;
  final Decimal starRating;
  final String description;
  final List<Ingredient> ingredients;

  const Dish(this.name, this.picture, this.price, this.starRating, this.description, this.ingredients);
}
import 'package:decimal/decimal.dart';

class Dish {
  final String name;
  final String picture;
  final Decimal price;
  final Decimal starRating;

  const Dish(this.name, this.picture, this.price, this.starRating);
}
import 'package:flutter_sushiman_ui/shared/data/models/dish.dart';

class DishType {
  final String name;
  final String picture;
  final List<Dish> dishes;

  const DishType(this.name, this.picture, this.dishes);
}

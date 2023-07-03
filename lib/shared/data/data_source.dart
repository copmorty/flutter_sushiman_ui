import 'package:decimal/decimal.dart';
import 'package:flutter_sushiman_ui/shared/data/models/dish.dart';
import 'package:flutter_sushiman_ui/shared/data/models/dish_type.dart';

final _sushiDishType = DishType(
  'Sushi',
  'assets/images/illustrations/ebi.png',
  [
    Dish('Original Sushi', 'assets/images/illustrations/original_sushi.png', Decimal.fromInt(21), Decimal.parse('4.8')),
    Dish('Shrimp Sushi', 'assets/images/illustrations/shrimp_sushi.png', Decimal.fromInt(23), Decimal.parse('4.8')),
    Dish('Ebi', 'assets/images/illustrations/ebi.png', Decimal.fromInt(20), Decimal.parse('4.7')),
    Dish('Tamago', 'assets/images/illustrations/tamago.png', Decimal.fromInt(25), Decimal.parse('4.4')),
  ],
);

final _ramenDishType = DishType(
  'Ramen',
  'assets/images/illustrations/noodles.png',
  [
    Dish('Noodles', 'assets/images/illustrations/noodles.png', Decimal.fromInt(15), Decimal.parse('4.0')),
    Dish('Miso', 'assets/images/illustrations/miso.png', Decimal.fromInt(18), Decimal.parse('4.3')),
    Dish('Shio', 'assets/images/illustrations/shio.png', Decimal.fromInt(14), Decimal.parse('4.5')),
  ],
);

final _makiDishType = DishType(
  'Maki',
  'assets/images/illustrations/tekkamaki.png',
  [
    Dish('Tekkamaki', 'assets/images/illustrations/tekkamaki.png', Decimal.fromInt(30), Decimal.parse('4.9')),
    Dish('Salmon Eggs', 'assets/images/illustrations/salmon_eggs.png', Decimal.fromInt(21), Decimal.parse('5')),
  ],
);

final dishTypesData = [_sushiDishType, _ramenDishType, _makiDishType];

final popularDishesData = [..._sushiDishType.dishes, ..._ramenDishType.dishes, ..._makiDishType.dishes]
    .where((dish) => dish.starRating >= Decimal.parse('4.5'))
    .toList()
  ..sort((a, b) => b.starRating.compareTo(a.starRating));

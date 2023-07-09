import 'package:decimal/decimal.dart';
import 'package:flutter_sushiman_ui/shared/data/models/dish.dart';
import 'package:flutter_sushiman_ui/shared/data/models/dish_type.dart';
import 'package:flutter_sushiman_ui/shared/data/models/ingredient.dart';

const _descriptionText =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';

const _riceIngredient = Ingredient('Rice', 'assets/images/illustrations/rice.png');
const _tunaIngredient = Ingredient('Tuna', 'assets/images/illustrations/tuna.png');
const _soySauceIngredient = Ingredient('Soy Sauce', 'assets/images/illustrations/soy_sauce.png');
const _shrimpIngredient = Ingredient('Shrimp', 'assets/images/illustrations/shrimp.png');
const _prawnIngredient = Ingredient('Prawn', 'assets/images/illustrations/prawn.png');
const _omeletteIngredient = Ingredient('Omelette', 'assets/images/illustrations/omelette.png');

final _sushiDishType = DishType(
  'Sushi',
  'assets/images/illustrations/ebi_100.png',
  [
    Dish('Original Sushi', 'assets/images/illustrations/original_sushi.png', Decimal.fromInt(21), Decimal.parse('4.8'), _descriptionText, [_riceIngredient, _tunaIngredient, _soySauceIngredient]),
    Dish('Shrimp Sushi', 'assets/images/illustrations/shrimp_sushi.png', Decimal.fromInt(23), Decimal.parse('4.8'), _descriptionText, [_riceIngredient, _shrimpIngredient, _soySauceIngredient]),
    Dish('Ebi', 'assets/images/illustrations/ebi.png', Decimal.fromInt(20), Decimal.parse('4.7'), _descriptionText, [_riceIngredient, _prawnIngredient, _soySauceIngredient]),
    Dish('Tamago', 'assets/images/illustrations/tamago.png', Decimal.fromInt(25), Decimal.parse('4.4'), _descriptionText, [_riceIngredient, _omeletteIngredient, _soySauceIngredient]),
  ],
);

final _ramenDishType = DishType(
  'Ramen',
  'assets/images/illustrations/noodles_100.png',
  [
    Dish('Noodles', 'assets/images/illustrations/noodles.png', Decimal.fromInt(15), Decimal.parse('4.0'), _descriptionText, []),
    Dish('Miso', 'assets/images/illustrations/miso.png', Decimal.fromInt(18), Decimal.parse('4.3'), _descriptionText, []),
    Dish('Shio', 'assets/images/illustrations/shio.png', Decimal.fromInt(14), Decimal.parse('4.5'), _descriptionText, []),
  ],
);

final _makiDishType = DishType(
  'Maki',
  'assets/images/illustrations/tekkamaki_100.png',
  [
    Dish('Tekkamaki', 'assets/images/illustrations/tekkamaki.png', Decimal.fromInt(30), Decimal.parse('4.9'), _descriptionText, []),
    Dish('Salmon Eggs', 'assets/images/illustrations/salmon_eggs.png', Decimal.fromInt(21), Decimal.parse('5'), _descriptionText, []),
  ],
);

final dishTypesData = [_sushiDishType, _ramenDishType, _makiDishType];

final popularDishesData = [..._sushiDishType.dishes, ..._ramenDishType.dishes, ..._makiDishType.dishes]
    .where((dish) => dish.starRating >= Decimal.parse('4.5'))
    .toList()
  ..sort((a, b) => b.starRating.compareTo(a.starRating));

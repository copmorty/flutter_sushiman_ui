import 'package:flutter/material.dart';
import 'package:flutter_sushiman_ui/screens/detail/widgets/ingredient_chip.dart';
import 'package:flutter_sushiman_ui/shared/data/models/dish.dart';
import 'package:flutter_sushiman_ui/shared/helpers/no_glow_scroll_behavior.dart';
import 'package:flutter_sushiman_ui/shared/sizes.dart';
import 'package:flutter_sushiman_ui/shared/widgets/screen_subtitle.dart';

class DetailBodyIngredients extends StatelessWidget {
  final Dish dish;

  const DetailBodyIngredients(this.dish, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (dish.ingredients.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: screenHorizontalPadding),
          child: ScreenSubtitle('Ingredients'),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 75,
          child: ScrollConfiguration(
            behavior: const NoGlowScrollBehavior(),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => IngredientChip(
                picture: dish.ingredients[index].picture,
                label: dish.ingredients[index].name,
              ),
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemCount: dish.ingredients.length,
              padding: const EdgeInsets.symmetric(horizontal: screenHorizontalPadding),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_sushiman_ui/shared/data/data_source.dart';
import 'package:flutter_sushiman_ui/shared/sizes.dart';
import 'package:flutter_sushiman_ui/shared/widgets/dish_rectangular_card.dart';

class HomeBottomList extends StatelessWidget {
  const HomeBottomList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(left: screenHorizontalPadding, right: screenHorizontalPadding, bottom: screenBottomPadding),
      sliver: SliverList.separated(
        itemBuilder: (context, index) => DishRectangularCard(popularDishesData[index], key: UniqueKey()),
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: popularDishesData.length,
      ),
    );
  }
}

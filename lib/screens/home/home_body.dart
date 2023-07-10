import 'package:flutter/material.dart';
import 'package:flutter_sushiman_ui/shared/data/data_source.dart';
import 'package:flutter_sushiman_ui/shared/sizes.dart';
import 'package:flutter_sushiman_ui/shared/widgets/dish_square_card.dart';
import 'package:flutter_sushiman_ui/screens/home/widgets/dish_type_chip.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  int currentDishTypeIndex = 0;

  void _selectDishType(int i) {
    setState(() {
      currentDishTypeIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 75,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => DishTypeChip(
              picture: dishTypesData[index].picture,
              label: dishTypesData[index].name,
              selected: index == currentDishTypeIndex,
              select: () => _selectDishType(index),
            ),
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: dishTypesData.length,
            padding: const EdgeInsets.symmetric(horizontal: screenHorizontalPadding),
          ),
        ),
        SizedBox(
          height: 225,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => DishSquareCard(dishTypesData[currentDishTypeIndex].dishes[index], key: UniqueKey()),
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: dishTypesData[currentDishTypeIndex].dishes.length,
            padding: const EdgeInsets.symmetric(horizontal: screenHorizontalPadding),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_sushiman_ui/shared/data/data_source.dart';
import 'package:flutter_sushiman_ui/shared/helpers/no_glow_scroll_behavior.dart';
import 'package:flutter_sushiman_ui/shared/sizes.dart';
import 'package:flutter_sushiman_ui/shared/widgets/dish_square_card.dart';
import 'package:flutter_sushiman_ui/screens/home/widgets/dish_type_chip.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> with SingleTickerProviderStateMixin {
  int _currentDishTypeIndex = 0;
  int _delayedCurrentDishTypeIndex = 0;
  final ScrollController _scrollController = ScrollController();
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _selectDishType(int i) async {
    _animationController.reverse();
    setState(() {
      _currentDishTypeIndex = i;
    });
    await Future.delayed(_animationController.duration!);
    _scrollController.jumpTo(0);
    setState(() {
      _delayedCurrentDishTypeIndex = i;
    });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 75,
          child: ScrollConfiguration(
            behavior: const NoGlowScrollBehavior(),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => DishTypeChip(
                picture: dishTypesData[index].picture,
                label: dishTypesData[index].name,
                selected: index == _currentDishTypeIndex,
                select: () => _selectDishType(index),
              ),
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemCount: dishTypesData.length,
              padding: const EdgeInsets.symmetric(horizontal: screenHorizontalPadding),
            ),
          ),
        ),
        SizedBox(
          height: 225,
          child: ScrollConfiguration(
            behavior: const NoGlowScrollBehavior(),
            child: ListView.separated(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => DishSquareCard(
                dish: dishTypesData[_delayedCurrentDishTypeIndex].dishes[index],
                animationController: _animationController,
                key: UniqueKey(),
              ),
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemCount: dishTypesData[_delayedCurrentDishTypeIndex].dishes.length,
              padding: const EdgeInsets.symmetric(horizontal: screenHorizontalPadding),
            ),
          ),
        )
      ],
    );
  }
}

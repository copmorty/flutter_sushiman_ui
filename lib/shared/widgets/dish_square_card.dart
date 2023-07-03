import 'package:flutter/material.dart';
import 'package:flutter_sushiman_ui/shared/colors.dart';
import 'package:flutter_sushiman_ui/shared/data/models/dish.dart';
import 'package:flutter_sushiman_ui/shared/helpers/custom_font_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class DishSquareCard extends StatelessWidget {
  final Dish dish;

  const DishSquareCard(this.dish, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: SizedBox(
        width: 180,
        child: Column(
          children: [
            SizedBox(
              height: 135,
              child: Stack(
                children: [
                  Row(
                    children: [
                      Expanded(child: Image.asset(dish.picture)),
                      const SizedBox(width: 30),
                    ],
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(CustomFontIcons.heartOutlined, size: 27),
                      color: blackColorOp038,
                      iconSize: 28,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(dish.name, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600, color: blackColor075)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$' + dish.price.toStringAsFixed(2),
                        style: TextStyle(fontFamily: GoogleFonts.roboto().fontFamily, color: blackColor087, fontSize: 17, fontWeight: FontWeight.w600),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star_rate_rounded, color: yellowishColor),
                          Text(
                            dish.starRating.toStringAsFixed(1),
                            style: TextStyle(fontFamily: GoogleFonts.roboto().fontFamily, color: blackColorOp038, fontSize: 17),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
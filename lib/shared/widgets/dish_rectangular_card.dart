import 'package:flutter/material.dart';
import 'package:flutter_sushiman_ui/shared/colors.dart';
import 'package:flutter_sushiman_ui/shared/data/models/dish.dart';
import 'package:flutter_sushiman_ui/shared/helpers/custom_font_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class DishRectangularCard extends StatelessWidget {
  final Dish dish;

  const DishRectangularCard(this.dish, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed('/detail', arguments: {'dish': dish, 'sourceWidgetKey': key}),
      child: Card(
        elevation: 0.2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Hero(
                  tag: 'dishPicture-${dish.name}-$key',
                  child: Image.asset(dish.picture, height: 80),
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(dish.name, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600, color: blackColorOp075)),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$' + dish.price.toStringAsFixed(2),
                          style: TextStyle(fontFamily: GoogleFonts.roboto().fontFamily, color: blackColorOp087, fontSize: 17, fontWeight: FontWeight.w600),
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
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CustomFontIcons.heartOutlined,
                        size: 27,
                      ),
                      color: blackColorOp038,
                      iconSize: 28,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

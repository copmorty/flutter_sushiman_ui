import 'package:flutter/material.dart';
import 'package:flutter_sushiman_ui/shared/colors.dart';
import 'package:flutter_sushiman_ui/shared/data/models/dish.dart';
import 'package:flutter_sushiman_ui/shared/helpers/custom_font_icons.dart';
import 'package:flutter_sushiman_ui/shared/sizes.dart';
import 'package:flutter_sushiman_ui/shared/widgets/text_vertical.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

class DetailHeader extends StatelessWidget {
  final Dish dish;
  final Key sourceWidgetKey;

  const DetailHeader({
    Key? key,
    required this.dish,
    required this.sourceWidgetKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 310,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Transform.rotate(
              origin: const Offset(80, 10),
              angle: 75 * math.pi / 180,
              child: const TextVertical(
                'メカジキ',
                style: TextStyle(color: blackColorOp004, fontWeight: FontWeight.w800, fontSize: 110, height: 1.1),
              ),
            ),
          ),
          const Positioned(
            right: screenHorizontalPadding,
            top: 80,
            child: TextVertical(
              '鮨オリ',
              style: TextStyle(color: blackColorOp087, fontWeight: FontWeight.w800, fontSize: 70, height: 1.1),
            ),
          ),
          Positioned(
            left: 0,
            top: 10,
            child: Hero(tag: 'dishPicture-${dish.name}-$sourceWidgetKey', child: Image.asset(dish.picture, fit: BoxFit.contain, height: 260, width: 260)),
          ),
          Positioned(
            bottom: 10,
            left: screenHorizontalPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.star_rate_rounded, color: yellowishColor),
                    const SizedBox(width: 5),
                    Text(
                      dish.starRating.toStringAsFixed(1),
                      style: TextStyle(fontFamily: GoogleFonts.roboto().fontFamily, color: blackColor, fontSize: 17),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  dish.name,
                  style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: screenHorizontalPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: () => Navigator.of(context).pop(), icon: const Icon(Icons.arrow_back, size: 30)),
                IconButton(onPressed: () {}, icon: const Icon(CustomFontIcons.heartOutlined, size: 30)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

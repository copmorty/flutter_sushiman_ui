import 'package:flutter/material.dart';
import 'package:flutter_sushiman_ui/shared/colors.dart';
import 'package:flutter_sushiman_ui/shared/data/models/dish.dart';
import 'package:flutter_sushiman_ui/shared/sizes.dart';
import 'package:flutter_sushiman_ui/shared/widgets/screen_subtitle.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailBodyDescription extends StatelessWidget {
  final Dish dish;

  const DetailBodyDescription(this.dish, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: screenHorizontalPadding),
          child: ScreenSubtitle('Description'),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: screenHorizontalPadding),
          child: Text(
            dish.description,
            style: TextStyle(
              fontFamily: GoogleFonts.roboto().fontFamily,
              color: blackColorOp045,
              height: 1.8,
              fontSize: 17,
            ),
          ),
        ),
      ],
    );
  }
}

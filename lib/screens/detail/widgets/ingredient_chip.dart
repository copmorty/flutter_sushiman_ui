import 'package:flutter/material.dart';
import 'package:flutter_sushiman_ui/shared/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class IngredientChip extends StatelessWidget {
  final String picture;
  final String label;

  const IngredientChip({
    Key? key,
    required this.picture,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: blackColorOp050,
      label: Row(
        children: [
          Image.asset(picture, height: 23),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              fontFamily: GoogleFonts.roboto().fontFamily,
              fontSize: 17,
              color: blackColorOp087,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
    );
  }
}

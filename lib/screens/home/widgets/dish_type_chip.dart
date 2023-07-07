import 'package:flutter/material.dart';
import 'package:flutter_sushiman_ui/shared/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class DishTypeChip extends StatelessWidget {
  final String picture;
  final String label;
  final bool selected;
  final Function select;

  const DishTypeChip({
    Key? key,
    required this.picture,
    required this.label,
    required this.selected,
    required this.select,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      selected: selected,
      label: Row(
        children: [
          Image.asset(picture, height: 33),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              fontFamily: GoogleFonts.roboto().fontFamily,
              fontSize: 17,
              color: selected ? reddishColor : blackColorOp038,
              fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ],
      ),
      onSelected: (bool selected) => select(),
      side: const BorderSide(color: whiteColor),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
    );
  }
}

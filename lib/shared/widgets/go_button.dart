import 'package:flutter/material.dart';
import 'package:flutter_sushiman_ui/shared/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class GoButton extends StatelessWidget {
  final String label;
  final Function function;
  final bool showArrow;
  final bool fullWidth;
  final double? labelSize;
  final double? verticalPadding;
  final double? horizontalPadding;

  const GoButton({
    Key? key,
    required this.label,
    required this.function,
    this.showArrow = true,
    this.fullWidth = true,
    this.labelSize,
    this.verticalPadding,
    this.horizontalPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => function(),
      child: Row(
        mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              fontFamily: GoogleFonts.roboto().fontFamily,
              fontSize: labelSize,
              color: whiteColor,
              fontWeight: FontWeight.w400,
            ),
          ),
          if (showArrow) ...[
            const SizedBox(width: 10),
            const Icon(
              Icons.arrow_forward_outlined,
              color: whiteColor,
            )
          ],
        ],
      ),
      style: TextButton.styleFrom(
          backgroundColor: whiteColorOp015,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
          padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 0, horizontal: fullWidth ? 0 : (horizontalPadding ?? 0))),
    );
  }
}

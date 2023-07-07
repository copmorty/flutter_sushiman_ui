import 'package:flutter/material.dart';
import 'package:flutter_sushiman_ui/shared/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenSubtitle extends StatelessWidget {
  final String text;

  const ScreenSubtitle(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: GoogleFonts.roboto().fontFamily,
        color: blackColorOp060,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.8,
      ),
    );
  }
}

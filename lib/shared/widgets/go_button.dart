import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoButton extends StatelessWidget {
  final String title;

  const GoButton(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: TextButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontFamily: GoogleFonts.roboto().fontFamily,
                fontSize: 17,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(width: 10),
            const Icon(
              Icons.arrow_forward_outlined,
              color: Colors.white,
            ),
          ],
        ),
        style: TextButton.styleFrom(
          backgroundColor: Colors.white.withOpacity(0.15),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
        ),
      ),
    );
  }
}

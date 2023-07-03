import 'package:flutter/material.dart';
import 'package:flutter_sushiman_ui/shared/colors.dart';
import 'package:flutter_sushiman_ui/shared/helpers/sliver_persistent_header_delegate.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeBottomTitle extends StatelessWidget {
  const HomeBottomTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      sliver: SliverPersistentHeader(
        pinned: true,
        delegate: SPHD(
          minHeight: 25,
          maxHeight: 25,
          child: Container(
            color: greyishColor,
            child: Text(
              'Popular Food',
              style: TextStyle(
                fontFamily: GoogleFonts.roboto().fontFamily,
                color: blackColor060,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.8,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

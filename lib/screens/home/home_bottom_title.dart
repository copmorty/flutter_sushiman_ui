import 'package:flutter/material.dart';
import 'package:flutter_sushiman_ui/shared/colors.dart';
import 'package:flutter_sushiman_ui/shared/helpers/sliver_persistent_header_delegate.dart';
import 'package:flutter_sushiman_ui/shared/sizes.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeBottomTitle extends StatelessWidget {
  const HomeBottomTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: screenHorizontalPadding, vertical: 7),
      sliver: SliverPersistentHeader(
        pinned: true,
        delegate: SPHD(
          minHeight: 40,
          maxHeight: 40,
          child: Container(
            color: greyishColor,
            padding: const EdgeInsets.only(left: 3),
            child: Align(
              alignment: Alignment.centerLeft,
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
      ),
    );
  }
}

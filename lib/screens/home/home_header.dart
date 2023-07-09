import 'package:flutter/material.dart';
import 'package:flutter_sushiman_ui/shared/colors.dart';
import 'package:flutter_sushiman_ui/shared/helpers/custom_font_icons.dart';
import 'package:flutter_sushiman_ui/shared/sizes.dart';
import 'package:flutter_sushiman_ui/shared/widgets/go_button.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: screenHorizontalPadding),
      child: Column(
        children: [
          _Banner(),
          SizedBox(height: 20),
          _SearchBar(),
        ],
      ),
    );
  }
}

class _Banner extends StatelessWidget {
  const _Banner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
          color: reddishColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: [
              Positioned(
                top: -40,
                right: -50,
                child: Image.asset(
                  'assets/images/illustrations/shrimps.png',
                  width: 200,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    Text(
                      'Get 32% Promo',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(color: whiteColor, fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 10),
                    GoButton(
                      label: 'Buy Food',
                      labelSize: 15,
                      function: () {},
                      showArrow: false,
                      fullWidth: false,
                      horizontalPadding: 30,
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: whiteColor, width: 1.5), borderRadius: BorderRadius.circular(25)),
        focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: reddishColor), borderRadius: BorderRadius.circular(25)),
        prefixIcon: const Icon(CustomFontIcons.search, color: blackColorOp038, size: 28),
        prefixIconConstraints: const BoxConstraints(minWidth: 65),
        hintText: 'Search here',
        hintStyle: TextStyle(fontFamily: GoogleFonts.roboto().fontFamily, color: blackColorOp038, fontSize: 17),
        filled: true,
        fillColor: greyishColor,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sushiman_ui/shared/colors.dart';
import 'package:flutter_sushiman_ui/shared/helpers/custom_system_ui_overlay_style.dart';
import 'package:flutter_sushiman_ui/shared/sizes.dart';
import 'package:flutter_sushiman_ui/shared/widgets/go_button.dart';
import 'package:flutter_sushiman_ui/shared/widgets/text_vertical.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: CustomSystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: reddishColor,
        body: SafeArea(
          bottom: false,
          child: Padding(
              padding: const EdgeInsets.only(bottom: screenBottomPadding),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Transform.rotate(
                      origin: const Offset(-180, -50),
                      angle: -45 * math.pi / 180,
                      child: TextVertical(
                        '日本食',
                        style: TextStyle(color: whiteColorOp045, fontWeight: FontWeight.w800, fontSize: screenHeight * 0.32, height: 1.1),
                      ),
                    ),
                  ),
                  Positioned(
                    right: screenHorizontalPadding,
                    top: screenHeight * 0.16,
                    child: TextVertical(
                      '日本食',
                      style: TextStyle(color: whiteColor, fontWeight: FontWeight.w800, fontSize: screenHeight * 0.10, height: 1.1),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: screenHorizontalPadding),
                              child: Text(
                                'SUSHIMAN',
                                style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: whiteColor, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Image.asset('assets/images/onboarding_image.png'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: screenHorizontalPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'THE TASTE OF JAPANESE FOOD',
                              style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: whiteColor, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Feel the taste of most populars Japanese foods from anywhere and anytime.',
                              style: GoogleFonts.roboto(
                                textStyle: const TextStyle(color: whiteColor, fontWeight: FontWeight.w300, fontSize: 16, letterSpacing: 1, height: 2),
                              ),
                            ),
                            const SizedBox(height: screenBottomPadding),
                            GoButton(
                              label: 'Get Started',
                              labelSize: 17,
                              verticalPadding: 18,
                              fullWidth: true,
                              function: () => Navigator.pushNamed(context, '/home'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

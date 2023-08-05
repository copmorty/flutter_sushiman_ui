import 'package:flutter/material.dart';
import 'package:flutter_sushiman_ui/screens/home/_screen.dart';
import 'package:flutter_sushiman_ui/screens/onboarding/_screen.dart';
import 'package:flutter_sushiman_ui/shared/route_transitions/custom_detail_route.dart';
import 'package:flutter_sushiman_ui/shared/route_transitions/scale_route.dart';
import 'package:flutter_sushiman_ui/shared/route_transitions/slide_left_route.dart';
import 'package:flutter_sushiman_ui/shared/themes/default_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sushiman App',
      theme: defaultTheme,
      onGenerateRoute: (settings) {
        if (settings.name == '/') return ScaleRoute(const OnboardingScreen(), settings);
        if (settings.name == '/home') return SlideLeftRoute(const HomeScreen(), settings);
        if (settings.name == '/detail') return CustomDetailRoute(settings);

        return ScaleRoute(const OnboardingScreen(), settings);
      },
    );
  }
}

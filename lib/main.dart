import 'package:flutter/material.dart';
import 'package:flutter_sushiman_ui/screens/detail/_screen.dart';
import 'package:flutter_sushiman_ui/screens/home/_screen.dart';
import 'package:flutter_sushiman_ui/screens/onboarding/_screen.dart';
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
      routes: {
        '/': (context) => const OnboardingScreen(),
        '/home': (context) => const HomeScreen(),
        '/detail': (context) => const DetailScreen(),
      },
    );
  }
}

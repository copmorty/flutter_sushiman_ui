import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sushiman_ui/screens/onboarding/_screen.dart';
import 'package:flutter_sushiman_ui/shared/themes/default_theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //top bar color
      statusBarIconBrightness: Brightness.light, //top bar icons
      // systemNavigationBarColor: Color(0xFFFAFAFA), //bottom bar color
      // systemNavigationBarIconBrightness: Brightness.dark, //bottom bar icons
    ),
  );
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
      home: const OnboardingScreen(),
    );
  }
}

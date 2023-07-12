import 'package:flutter/services.dart';
import 'package:flutter_sushiman_ui/shared/colors.dart';

class CustomSystemUiOverlayStyle {
  static const light = SystemUiOverlayStyle(
    statusBarColor: transparentColor,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
  );

  static const dark = SystemUiOverlayStyle(
    statusBarColor: transparentColor,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  );
}

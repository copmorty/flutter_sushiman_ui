import 'package:flutter/material.dart';
import 'package:flutter_sushiman_ui/screens/detail/_screen.dart';

class CustomDetailRoute extends PageRouteBuilder {
  @override
  final RouteSettings settings;

  CustomDetailRoute(this.settings)
      : super(
          transitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return DetailScreen(animation);
          },
        );
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sushiman_ui/screens/detail/detail_body_description.dart';
import 'package:flutter_sushiman_ui/screens/detail/detail_body_ingredients.dart';
import 'package:flutter_sushiman_ui/screens/detail/detail_footer_cart.dart';
import 'package:flutter_sushiman_ui/screens/detail/detail_header.dart';
import 'package:flutter_sushiman_ui/shared/data/models/dish.dart';
import 'package:flutter_sushiman_ui/shared/helpers/custom_system_ui_overlay_style.dart';
import 'package:flutter_sushiman_ui/shared/sizes.dart';

class DetailScreen extends StatelessWidget {
  final Animation<double> transitionAnimation;

  const DetailScreen(
    this.transitionAnimation, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final safeAreaBottomPadding = MediaQuery.of(context).padding.bottom;
    final footerCartHeight = 150 + safeAreaBottomPadding;
    final bottomPadding = footerCartHeight + screenBottomPadding;

    final map = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final Dish dish = map['dish'];
    final Key sourceWidgetKey = map['sourceWidgetKey'];

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: CustomSystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              AnimatedBuilder(
                animation: transitionAnimation,
                builder: (context, child) {
                  return FadeTransition(
                    opacity: CurvedAnimation(parent: transitionAnimation, curve: Curves.easeOutQuart),
                    child: child,
                  );
                },
                child: ListView(
                  padding: EdgeInsets.only(bottom: bottomPadding),
                  children: [
                    DetailHeader(dish: dish, sourceWidgetKey: sourceWidgetKey),
                    const SizedBox(height: 20),
                    DetailBodyIngredients(dish),
                    DetailBodyDescription(dish),
                  ],
                ),
              ),
              AnimatedBuilder(
                animation: transitionAnimation,
                builder: (context, child) {
                  return SlideTransition(
                    position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(
                      CurvedAnimation(
                        parent: transitionAnimation,
                        curve: Curves.bounceIn,
                      ),
                    ),
                    child: child,
                  );
                },
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: DetailFooterCart(dish: dish, boxHeight: footerCartHeight),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

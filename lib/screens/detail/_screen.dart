import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sushiman_ui/screens/detail/detail_body_description.dart';
import 'package:flutter_sushiman_ui/screens/detail/detail_body_ingredients.dart';
import 'package:flutter_sushiman_ui/screens/detail/detail_footer_cart.dart';
import 'package:flutter_sushiman_ui/screens/detail/detail_header.dart';
import 'package:flutter_sushiman_ui/shared/data/models/dish.dart';
import 'package:flutter_sushiman_ui/shared/helpers/system_ui_overlay_style.dart';
import 'package:flutter_sushiman_ui/shared/sizes.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dish = ModalRoute.of(context)!.settings.arguments as Dish;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: darkSystemUiOverlayStyle,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(bottom: screenBottomPadding),
                  children: [
                    DetailHeader(dish),
                    const SizedBox(height: 20),
                    DetailBodyIngredients(dish),
                    DetailBodyDescription(dish),
                  ],
                ),
              ),
              DetailFooterCart(dish),
            ],
          ),
        ),
      ),
    );
  }
}

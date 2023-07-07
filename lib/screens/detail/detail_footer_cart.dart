import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sushiman_ui/shared/colors.dart';
import 'package:flutter_sushiman_ui/shared/data/models/dish.dart';
import 'package:flutter_sushiman_ui/shared/sizes.dart';
import 'package:flutter_sushiman_ui/shared/widgets/go_button.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailFooterCart extends StatelessWidget {
  final Dish dish;
  const DetailFooterCart(this.dish, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.symmetric(horizontal: screenHorizontalPadding),
      color: reddishColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _CartRow(dish),
          const SizedBox(height: 20),
          GoButton(
            label: 'Buy Now',
            labelSize: 17,
            verticalPadding: 18,
            fullWidth: true,
            function: () {},
          ),
        ],
      ),
    );
  }
}

class _CartRow extends StatefulWidget {
  final Dish dish;

  const _CartRow(this.dish, {Key? key}) : super(key: key);

  @override
  State<_CartRow> createState() => _CartRowState();
}

class _CartRowState extends State<_CartRow> {
  int dishQuantity = 1;

  void _updateCounter(int value) {
    final newDishQuantity = dishQuantity + value;
    if (newDishQuantity == 0) return;

    setState(() {
      dishQuantity = newDishQuantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    Decimal cartAmount = widget.dish.price * Decimal.fromInt(dishQuantity);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '\$${cartAmount.toStringAsFixed(2)}',
          style: TextStyle(
            fontFamily: GoogleFonts.roboto().fontFamily,
            fontSize: 20,
            color: whiteColor,
          ),
        ),
        Row(
          children: [
            _CounterButton(Icons.remove, () => _updateCounter(-1)),
            SizedBox(
              width: 50,
              child: Center(
                child: Text(
                  dishQuantity.toString(),
                  style: TextStyle(fontFamily: GoogleFonts.roboto().fontFamily, color: whiteColor, fontSize: 20),
                ),
              ),
            ),
            _CounterButton(Icons.add, () => _updateCounter(1)),
          ],
        ),
      ],
    );
  }
}

class _CounterButton extends StatelessWidget {
  final IconData icon;
  final Function function;

  const _CounterButton(this.icon, this.function, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: () => function(),
        splashColor: reddishColor,
        highlightColor: whiteColorOp015,
        borderRadius: BorderRadius.circular(25.0),
        child: Container(
          width: 38,
          height: 38,
          decoration: const BoxDecoration(
            color: whiteColorOp015,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(icon, color: whiteColor),
          ),
        ),
      ),
    );
  }
}

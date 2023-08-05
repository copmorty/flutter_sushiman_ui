import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sushiman_ui/shared/colors.dart';
import 'package:flutter_sushiman_ui/shared/data/models/dish.dart';
import 'package:flutter_sushiman_ui/shared/sizes.dart';
import 'package:flutter_sushiman_ui/shared/widgets/go_button.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailFooterCart extends StatelessWidget {
  final Dish dish;
  final double boxHeight;

  const DetailFooterCart({
    Key? key,
    required this.dish,
    required this.boxHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: boxHeight,
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
  int _dishQuantity = 1;
  int _previousDishQuantity = 1;
  final _tweenBottom = Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero);
  final _tweenTop = Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero);

  void _updateCounter(int value) {
    final newDishQuantity = _dishQuantity + value;
    if (newDishQuantity == 0 || newDishQuantity > 100) return;

    setState(() {
      _previousDishQuantity = _dishQuantity;
      _dishQuantity = newDishQuantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    Decimal cartAmount = widget.dish.price * Decimal.fromInt(_dishQuantity);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              '\$',
              style: TextStyle(
                fontFamily: GoogleFonts.roboto().fontFamily,
                fontSize: 20,
                color: whiteColor,
              ),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: Text(
                cartAmount.toStringAsFixed(2),
                key: ValueKey(cartAmount),
                style: TextStyle(
                  fontFamily: GoogleFonts.roboto().fontFamily,
                  fontSize: 20,
                  color: whiteColor,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            _CounterButton(Icons.remove, () => _updateCounter(-1)),
            SizedBox(
              width: 50,
              child: Center(
                child: ClipRect(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      if (child.key == ValueKey(_dishQuantity)) {
                        return SlideTransition(
                          position: _dishQuantity > _previousDishQuantity ? _tweenBottom.animate(animation) : _tweenTop.animate(animation),
                          child: child,
                        );
                      } else {
                        return SlideTransition(
                          position: _dishQuantity > _previousDishQuantity ? _tweenTop.animate(animation) : _tweenBottom.animate(animation),
                          child: child,
                        );
                      }
                    },
                    child: Text(
                      _dishQuantity.toString(),
                      key: ValueKey(_dishQuantity),
                      style: TextStyle(fontFamily: GoogleFonts.roboto().fontFamily, color: whiteColor, fontSize: 20),
                    ),
                  ),
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

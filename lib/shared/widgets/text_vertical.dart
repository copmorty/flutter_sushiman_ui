import 'package:flutter/material.dart';

class TextVertical extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const TextVertical(this.text, {Key? key, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textList = text.split('');

    return SingleChildScrollView(
      clipBehavior: Clip.none,
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          for (var char in textList) Text(char, style: style),
        ],
      ),
    );
  }
}

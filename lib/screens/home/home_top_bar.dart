import 'package:flutter/material.dart';
import 'package:flutter_sushiman_ui/shared/colors.dart';
import 'package:flutter_sushiman_ui/shared/helpers/custom_font_icons.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: () {}, icon: const Icon(CustomFontIcons.menuTwoBars)),
        Row(
          children: [
            const Icon(CustomFontIcons.locationOutlined, color: reddishColor),
            const SizedBox(width: 5),
            Text(
              'Jakarta',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const CircleAvatar(
          backgroundColor: lightReddishColor,
          backgroundImage: AssetImage('assets/images/profile_pic.png'),
        )
      ],
    );
  }
}

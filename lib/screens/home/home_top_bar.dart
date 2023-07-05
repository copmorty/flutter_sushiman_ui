import 'package:flutter/material.dart';
import 'package:flutter_sushiman_ui/shared/colors.dart';
import 'package:flutter_sushiman_ui/shared/helpers/custom_font_icons.dart';
import 'package:flutter_sushiman_ui/shared/helpers/sliver_persistent_header_delegate.dart';
import 'package:flutter_sushiman_ui/shared/sizes.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SPHD(
        minHeight: 60,
        maxHeight: 60,
        child: Material(
          color: greyishColor,
          child: Row(
            children: [
              const SizedBox(width: screenHorizontalPadding),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(CustomFontIcons.menuTwoBars),
                      splashRadius: 30,
                    ),
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
                ),
              ),
              const SizedBox(width: screenHorizontalPadding),
            ],
          ),
        ),
      ),
    );
  }
}

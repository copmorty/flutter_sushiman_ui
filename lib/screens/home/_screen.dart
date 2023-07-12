import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sushiman_ui/screens/home/home_body.dart';
import 'package:flutter_sushiman_ui/screens/home/home_bottom_list.dart';
import 'package:flutter_sushiman_ui/screens/home/home_bottom_title.dart';
import 'package:flutter_sushiman_ui/screens/home/home_header.dart';
import 'package:flutter_sushiman_ui/screens/home/home_top_bar.dart';
import 'package:flutter_sushiman_ui/shared/helpers/custom_system_ui_overlay_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: CustomSystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: CustomScrollView(
            slivers: [
              const HomeTopBar(),
              SliverList(
                delegate: SliverChildListDelegate(const [
                  SizedBox(height: 15),
                  HomeHeader(),
                  SizedBox(height: 10),
                  HomeBody(),
                ]),
              ),
              const HomeBottomTitle(),
              const HomeBottomList(),
            ],
          ),
        ),
      ),
    );
  }
}

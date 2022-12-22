import 'package:flutter/material.dart';


import '../../../core/util/resources/assets_manager.dart';
import '../../../core/util/resources/color_manager.dart';

class WidgetSponsors extends StatelessWidget {
  const WidgetSponsors({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: ColorManager.whiteColor,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Image.asset(
            AssetsManager.sponsors1PNG,
            width: 180,
          ),
          Image.asset(
            AssetsManager.sponsors2PNG,
            width: 180,
          ),
          Image.asset(
            AssetsManager.sponsors3PNG,
            width: 180,
          ),
        ],
      ),
    );
  }
}

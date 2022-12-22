import 'package:flutter/material.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';

class WidgetImageAndIcon extends StatelessWidget {
  // use it to put icon above image useing stack
  const WidgetImageAndIcon({super.key , required this.height, required this.imageURL , required this.width, required this.iconSize});
  final double height;
  final double width;
  final double iconSize;
  final String imageURL;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Image.network(
          imageURL,
          fit: BoxFit.cover,
          height:height,
          width: width,
        ),
        Container(
          color: ColorManager.mainColor,
          width: iconSize,
          height: iconSize,
          child: Image.asset(AssetsManager.logoPNG),
        ),
      ],
    );
  }
}

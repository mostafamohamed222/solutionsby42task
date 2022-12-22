import 'package:flutter/material.dart';
import '../../../../core/util/resources/color_manager.dart';


class MyOutlinedButton extends StatelessWidget {
  const MyOutlinedButton({
    Key? key,
    required this.onTap,
    required this.label,
  }) : super(key: key);

  final GestureTapCallback? onTap;
  final String label;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .85,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  //to set border radius to button
                  borderRadius: BorderRadius.circular(8)),
              backgroundColor: ColorManager.mainColor),
          child: Text(label),
        ),
      ),
    );
  }
}

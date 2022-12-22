import 'package:flutter/material.dart';


import '../../../core/util/resources/color_manager.dart';

class LabelAndColor extends StatelessWidget {
 LabelAndColor({super.key, required this.label, required this.color , this.ontap});


  final String label;
  final Color color;
  VoidCallback? ontap = () {};
  @override
  Widget build(BuildContext context) {
   // use to to show label color and text
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            width: 3,
            height: 30,
            color: color,
          ),
          const SizedBox(
            width: 30,
          ),
          InkWell(
            onTap: ontap,
            child: Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: ColorManager.whiteColor, fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}

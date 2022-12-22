import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:solutionsby42task/core/util/resources/color_manager.dart';

import '../../../translations/locale_keys.g.dart';

class WidgetHeader extends StatelessWidget {
  WidgetHeader({super.key, required this.label, this.isMore = false , this.ontap });

  String label;
  bool isMore;
  VoidCallback? ontap = (){};

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15 , vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 24 , fontWeight: FontWeight.bold),
          ),
          isMore
              ? InkWell(
                  onTap: ontap,
                  child: Text(
                    LocaleKeys.more.tr(),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: ColorManager.blueColor,
                        ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

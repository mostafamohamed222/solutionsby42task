import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:solutionsby42task/core/util/resources/color_manager.dart';

import '../../../core/util/resources/assets_manager.dart';
import '../../../translations/locale_keys.g.dart';

class WidgetClub extends StatelessWidget {
  const WidgetClub({super.key, required this.number});

  final int number;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: ColorManager.grey3,
                width: 2,
              ),
            ),
            child: Image.asset(AssetsManager.clubeIconPNG),
          ),
          Text(
            LocaleKeys.clubName.tr(),
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: ColorManager.blackColor,
                  fontSize: 18,
                ),
          ),
          Text(
            "${number} %",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 18,
                  color: ColorManager.grey2,
                ),
          )
        ],
      ),
    );
  }
}

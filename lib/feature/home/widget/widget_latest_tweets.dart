import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:solutionsby42task/core/util/resources/color_manager.dart';

import '../../../core/util/resources/assets_manager.dart';
import '../../../translations/locale_keys.g.dart';

class WidgetLatestTweet extends StatelessWidget {
  const WidgetLatestTweet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: ColorManager.whiteColor,
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(AssetsManager.logoPNG),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.saudiLeague.tr(),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: ColorManager.blackColor,
                          fontSize: 18,
                        ),
                  ),
                  Text(
                    "acount@",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 14,
                        ),
                  ),
                ],
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
            child: Text(
                "هذا النص ثابت غير متغير من خلال اللغات هذا النص ثابت غير متغير من خلال اللغات هذا النص ثابت غير متغير من خلال اللغات هذا النص ثابت غير متغير من خلال اللغات "),
          )
        ],
      ),
    );
  }
}

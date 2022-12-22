import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:solutionsby42task/core/util/resources/color_manager.dart';

import '../../../core/util/resources/assets_manager.dart';
import '../../../translations/locale_keys.g.dart';

class WidgetMatch extends StatelessWidget {
  const WidgetMatch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      color: ColorManager.whiteColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                AssetsManager.clubeIconPNG,
                width: 60,
                height: 50,
              ),
              Text(
                LocaleKeys.clubName.tr(),
                style: Theme.of(context).textTheme.bodyLarge!,
              ),
            ],
          ),
          Column(
            children: [
              const Text("23:00"),
              Text(
                LocaleKeys.matchDate.tr(),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: ColorManager.grey3),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                LocaleKeys.clubName.tr(),
                style: Theme.of(context).textTheme.bodyLarge!,
              ),
              Image.asset(
                AssetsManager.clubeIconPNG,
                width: 60,
                height: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

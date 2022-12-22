import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:solutionsby42task/core/util/widgets/widgetimageandicon.dart';

import '../../../core/appbloc/app_bloc.dart';
import '../../../core/util/resources/color_manager.dart';
import '../../../translations/locale_keys.g.dart';

class WidgetLatestnews extends StatelessWidget {
  const WidgetLatestnews({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WidgetImageAndIcon(
            imageURL: AppBloc.get(context).news[0].image,
            height: MediaQuery.of(context).size.height * .20,
            width: MediaQuery.of(context).size.width,
            iconSize: 50,
          ),
          Text(
            LocaleKeys.sportsLeague.tr(),
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: ColorManager.grey3),
          ),
          Text(
            AppBloc.get(context).language == "ar"
                ? AppBloc.get(context).news[0].titleAr
                : AppBloc.get(context).news[0].titleEn,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

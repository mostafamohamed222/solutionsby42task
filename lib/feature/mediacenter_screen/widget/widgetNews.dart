import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solutionsby42task/core/appbloc/app_bloc.dart';
import 'package:solutionsby42task/core/util/widgets/widgetimageandicon.dart';
import 'package:solutionsby42task/models/newsmodel.dart';

import '../../../core/appbloc/app_events.dart';
import '../../../core/util/resources/color_manager.dart';
import '../../../core/util/resources/named_route_screens.dart';
import '../../../translations/locale_keys.g.dart';

class WidgetNews extends StatelessWidget {
  const WidgetNews({super.key, required this.news});

  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          BlocProvider.of<AppBloc>(context)
                            .add(SelectNewSEvent(news: news));
          Navigator.pushNamed(context, ScreensRouteName.singleNewsScreen);
        },
        child: Row(
          children: [
            WidgetImageAndIcon(
              imageURL: news.image,
              height: 100,
              width: 100,
              iconSize: 30,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width*.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.sportsLeague.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: ColorManager.grey3),
                  ),
                  Text(
                    AppBloc.get(context).language == 'ar'
                        ? news.titleAr
                        : news.titleEn,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                        maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    news.getDataTime(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: ColorManager.grey3),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solutionsby42task/core/util/resources/color_manager.dart';
import 'package:solutionsby42task/feature/home/widget/widget_club.dart';
import 'package:solutionsby42task/feature/home/widget/widget_header.dart';
import 'package:solutionsby42task/feature/home/widget/widget_latest_news.dart';
import 'package:solutionsby42task/feature/home/widget/widget_latest_tweets.dart';
import 'package:solutionsby42task/feature/home/widget/widget_match.dart';
import 'package:solutionsby42task/feature/home/widget/widgetsponsors.dart';

import '../../core/appbloc/app_bloc.dart';
import '../../core/appbloc/app_events.dart';
import '../../translations/locale_keys.g.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            WidgetHeader(
              label: LocaleKeys.latestNews.tr(),
              isMore: true,
              ontap: () {
                BlocProvider.of<AppBloc>(context)
                    .add(ToggleInNavBarEvent(index: 2));
              },
            ),
            const WidgetLatestnews(),
            WidgetHeader(
              label: LocaleKeys.upcomingMatches.tr(),
              isMore: true,
            ),
            const WidgetMatch(),
            const WidgetMatch(),
            const WidgetMatch(),
            WidgetHeader(
              label: LocaleKeys.latestTweets.tr(),
              isMore: true,
            ),
            const WidgetLatestTweet(),
            const WidgetLatestTweet(),
            WidgetHeader(
              label: LocaleKeys.PredictWhoIsTheWinner.tr(),
            ),
            Container(
              color: ColorManager.whiteColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  WidgetClub(number: 20),
                  WidgetClub(number: 30),
                  WidgetClub(number: 50),
                ],
              ),
            ),
            WidgetHeader(
              label: LocaleKeys.sponsors.tr(),
            ),
            const WidgetSponsors(),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

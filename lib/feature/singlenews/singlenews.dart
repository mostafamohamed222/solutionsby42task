import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solutionsby42task/core/appbloc/app_bloc.dart';
import 'package:solutionsby42task/core/appbloc/app_state.dart';
import 'package:solutionsby42task/core/util/resources/color_manager.dart';
import 'package:solutionsby42task/models/newsmodel.dart';

import '../../translations/locale_keys.g.dart';

class SingleNewsScreen extends StatelessWidget {
  SingleNewsScreen({super.key});
  late NewsModel news;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppState>(
      builder: (context, state) {
        // get news to show it in screen
        if (state is SuccessSlecteNewsState) {
          news = state.news;
        }
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              // make sliver app bar to show and not show when scroll
              SliverAppBar(
                pinned: true,
                snap: false,
                floating: false,
                expandedHeight: 160.0,
                centerTitle: true,
                actions: [Icon(Icons.share)],
                backgroundColor: ColorManager.mainColor,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    news.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  // show the news data image and title also content 
                  (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      color: ColorManager.whiteColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppBloc.get(context).language == 'ar'
                                ? news.titleAr
                                : news.titleEn,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Text(
                            LocaleKeys.saudiLeague.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontSize: 14, color: ColorManager.grey2),
                          ),
                          Text(
                            news.getDataTime(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontSize: 14, color: ColorManager.grey2),
                          ),
                          Text(
                            AppBloc.get(context).language == 'ar'
                                ? news.contentAr
                                : news.contentEn,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: 1,
                ),
              ),
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}

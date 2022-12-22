import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:solutionsby42task/core/util/resources/color_manager.dart';
import 'package:solutionsby42task/feature/mediacenter_screen/newsScreen.dart';

import '../../translations/locale_keys.g.dart';

class MediaCenterScreen extends StatelessWidget {
  const MediaCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // tab bar to toggle between news , image and videos
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 50,
              color: ColorManager.mainColor,
              child: TabBar(
                labelColor: ColorManager.whiteColor,
                indicatorColor: ColorManager.whiteColor,
                tabs: [
                  Text(LocaleKeys.news.tr()),
                  Text(LocaleKeys.image.tr()),
                  Text(LocaleKeys.videos.tr()),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Column(
                    children: const [
                      // news Screen
                      NewsScreen(),
                    ],
                  ),
                  const Center(
                    child: Text("image page"),
                  ),
                  const Center(
                    child: Text("videos page"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

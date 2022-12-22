import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solutionsby42task/core/appbloc/app_bloc.dart';
import 'package:solutionsby42task/core/appbloc/app_events.dart';
import 'package:solutionsby42task/core/appbloc/app_state.dart';
import 'package:solutionsby42task/core/util/resources/color_manager.dart';
import 'package:solutionsby42task/feature/home/home_screen.dart';
import 'package:solutionsby42task/feature/mediacenter_screen/mediacenterscreen.dart';
import 'package:solutionsby42task/feature/more_screen/morescreen.dart';

import '../../core/util/resources/assets_manager.dart';
import '../../translations/locale_keys.g.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  // screens to toggle between it in app and put Container not found page
  List screens = [
    const HomeScreen(),
    Container(),
    const MediaCenterScreen(),
    Container(),
    const MoreScreen()
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        // use it to toggle between screen and use index from bloc
        if (state is SuccessToggleNavBarState) {
          index = state.index;
        }
        return Scaffold(
          appBar: AppBar(
            // use condtion to change app bar in more page
            title: index != 4
                ? Center(
                    child: Image.asset(
                      fit: BoxFit.fitHeight,
                      AssetsManager.logoPNG,
                    ),
                  )
                : Image.asset(
                    fit: BoxFit.fitHeight,
                    AssetsManager.logoPNG,
                  ),
            backgroundColor: ColorManager.mainColor,
          ),
          // show screen
          body: screens[index],
          // bottomNavigationBar 
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              index = value;
              // use bloc to toggle in nav bar 
              BlocProvider.of<AppBloc>(context)
                  .add(ToggleInNavBarEvent(index: value));
            },
            currentIndex: index,
            backgroundColor: ColorManager.mainColor,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: ColorManager.whiteColor,
            unselectedItemColor: ColorManager.grey3,
            selectedLabelStyle: const TextStyle(
              overflow: TextOverflow.visible,
            ),
            unselectedLabelStyle: const TextStyle(
              overflow: TextOverflow.visible,
            ),
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(AssetsManager.homeIcon),
                label: LocaleKeys.home.tr(),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(AssetsManager.dnsIcon),
                label: LocaleKeys.leagueTable.tr(),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(AssetsManager.newIcon),
                label: LocaleKeys.MediaCenter.tr(),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(AssetsManager.favoritesIcon),
                label: LocaleKeys.CompleteStats.tr(),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(AssetsManager.moreIcon),
                label: LocaleKeys.more.tr(),
              ),
            ],
          ),
        );
      },
    );
  }
}

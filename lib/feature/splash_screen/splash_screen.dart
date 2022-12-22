import 'dart:async';

import 'package:flutter/material.dart';
import 'package:solutionsby42task/core/appbloc/app_bloc.dart';

import 'package:solutionsby42task/core/network/diohelper.dart';

import '../../core/appbloc/app_events.dart';
import '../../core/util/resources/assets_manager.dart';
import '../../core/util/resources/color_manager.dart';
import '../../core/util/resources/named_route_screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // call init for dio , call get news form bloc and navigate to nav bar sreen after 6 seconds
    super.initState();
    AppBloc.get(context).add(GetNewsEvent());
    DioHelper.init();
    Timer.periodic(const Duration(seconds: 6), (timer) {
      Navigator.pushNamedAndRemoveUntil(
          context, ScreensRouteName.navBarScreen, (route) => false);
      timer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: ColorManager.mainColor,
        image: DecorationImage(
          image: AssetImage(AssetsManager.logoPNG),
        ),
      ),
    );
  }
}

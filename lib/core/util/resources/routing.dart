import 'package:flutter/material.dart';
import 'package:solutionsby42task/feature/mediacenter_screen/mediacenterscreen.dart';
import 'package:solutionsby42task/feature/nav_bar/nav_bar.dart';
import 'package:solutionsby42task/feature/singlenews/singlenews.dart';

import '../../../feature/contactus/contact_us.dart';
import '../../../feature/home/home_screen.dart';
import 'named_route_screens.dart';
import '../../../feature/splash_screen/splash_screen.dart';


class Routers{

  static Route<dynamic> generateRoute(RouteSettings settings){

    switch(settings.name){
      case ScreensRouteName.splashScreen:
        return MaterialPageRoute(builder: (_)=>const SplashScreen());
      case ScreensRouteName.homeScreen:
        return MaterialPageRoute(builder: (_)=>const HomeScreen());
      case ScreensRouteName.navBarScreen:
        return MaterialPageRoute(builder: (_)=>const NavBarScreen());
      case ScreensRouteName.mediaCenterScreen:
        return MaterialPageRoute(builder: (_)=>const MediaCenterScreen());
      case ScreensRouteName.singleNewsScreen:
        return MaterialPageRoute(builder: (_)=> SingleNewsScreen());
      case ScreensRouteName.contactUsScreen:
        return MaterialPageRoute(builder: (_)=> ContactUsPage());
      default:
        return MaterialPageRoute(builder: (_)=>const Center(child: Text("no page on this route"),));
    }

  }
}
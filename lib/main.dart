import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solutionsby42task/core/appbloc/app_bloc.dart';
import 'package:solutionsby42task/core/appbloc/app_events.dart';
import 'package:solutionsby42task/core/util/resources/named_route_screens.dart';
import 'package:solutionsby42task/core/util/resources/routing.dart';
import 'package:solutionsby42task/translations/codegen_loader.g.dart';
import 'package:sizer/sizer.dart';

import 'core/util/resources/bloc_observer_manager.dart';

main() async {
  Bloc.observer = BlocObserverManager();

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('ar'),
      startLocale: const Locale('ar'),
      assetLoader: const CodegenLoader(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => BlocProvider(
        create: (context) => AppBloc(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          initialRoute: ScreensRouteName.splashScreen,
          onGenerateRoute: Routers.generateRoute,
        ),
      ),
    );
  }
}

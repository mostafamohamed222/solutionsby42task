import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solutionsby42task/core/appbloc/app_bloc.dart';
import 'package:solutionsby42task/core/appbloc/app_state.dart';
import 'package:solutionsby42task/core/util/resources/color_manager.dart';
import 'package:solutionsby42task/feature/more_screen/widget/label.dart';

import '../../core/appbloc/app_events.dart';
import '../../core/util/resources/named_route_screens.dart';
import '../../translations/locale_keys.g.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppState>(
      builder: (context, state) {
        return Container(
          color: ColorManager.mainColor,
          child: Column(
            children: [
              LabelAndColor(
                  label: LocaleKeys.guideClubs.tr(),
                  color: ColorManager.whiteColor),
              LabelAndColor(
                  label: LocaleKeys.guideStadiums.tr(),
                  color: ColorManager.whiteColor),
              LabelAndColor(
                  label: LocaleKeys.whoUs.tr(), color: ColorManager.redColor),
              LabelAndColor(
                  label: LocaleKeys.systems.tr(),
                  color: ColorManager.greenColor),
              LabelAndColor(
                  label: LocaleKeys.committees.tr(),
                  color: ColorManager.blueColor),
              LabelAndColor(
                label: LocaleKeys.contactsUs.tr(),
                color: ColorManager.whiteColor,
                ontap: () {
                  Navigator.pushNamed(
                      context, ScreensRouteName.contactUsScreen);
                },
              ),
              LabelAndColor(
                  label: LocaleKeys.shereApp.tr(),
                  color: ColorManager.redColor),
              LabelAndColor(
                  label: LocaleKeys.join.tr(), color: ColorManager.greenColor),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Icon(
                      Icons.facebook,
                      color: ColorManager.whiteColor,
                    ),
                    Icon(
                      Icons.facebook,
                      color: ColorManager.whiteColor,
                    ),
                    Icon(
                      Icons.facebook,
                      color: ColorManager.whiteColor,
                    ),
                    Icon(
                      Icons.facebook,
                      color: ColorManager.whiteColor,
                    ),
                    Icon(
                      Icons.facebook,
                      color: ColorManager.whiteColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.translate,
                      color: ColorManager.whiteColor,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    BlocConsumer<AppBloc, AppState>(
                      builder: (context, state) {
                        return InkWell(
                          onTap: () async {
                            BlocProvider.of<AppBloc>(context)
                                .add(ChangeLanguageEvent(context: context));
                          },
                          child: Text(
                            LocaleKeys.lang.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: ColorManager.whiteColor,
                                    fontSize: 18),
                          ),
                        );
                      },
                      listener: (context, state) {},
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solutionsby42task/core/appbloc/app_bloc.dart';
import 'package:solutionsby42task/core/appbloc/app_state.dart';
import 'package:solutionsby42task/core/util/resources/assets_manager.dart';
import 'package:solutionsby42task/core/util/resources/color_manager.dart';
import 'package:solutionsby42task/feature/contactus/login_form1.dart';
import 'package:solutionsby42task/feature/contactus/login_form2.dart';
import 'package:solutionsby42task/feature/contactus/send_request.dart';

import '../../core/appbloc/app_events.dart';
import '../../translations/locale_keys.g.dart';

// ignore: must_be_immutable
class ContactUsPage extends StatelessWidget {
  ContactUsPage({super.key});
  // bool to know go to form to or not
  bool goToform2 = false;
  // bool to know we end to form to or not
  bool isSend = false;
  // string to take request id from api
  String id = "";
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppState>(
      builder: (context, state) {
        // check data to show any form or end request
        if (state is GoToSecondFormState) {
          goToform2 = true;
          isSend = false;
        } else if (state is SuccessSendRequestToAPIState) {
          goToform2 = false;
          isSend = true;
          id = state.id;
        } else if (state is BackToFirstFormState) {
          goToform2 = false;
          isSend = false;
        }
        //check if request end or no to show form or end page to show request id
        return isSend
            ? SendRequestPage(
                id: id,
              )
            : Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  leading: IconButton(
                    onPressed: () {
                      if (goToform2 == true) {
                        BlocProvider.of<AppBloc>(context)
                            .add(BackToFirstFormEvent());
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    icon: goToform2
                        ? const Icon(
                            Icons.arrow_forward_ios,
                            color: ColorManager.blackColor,
                          )
                        : const Icon(
                            Icons.cancel_outlined,
                            color: ColorManager.blackColor,
                          ),
                    //replace with our own icon data.
                  ),
                  title: Image.asset(AssetsManager.logoPNG),
                  centerTitle: true,
                  backgroundColor: ColorManager.whiteColor,
                ),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: ColorManager.whiteColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                goToform2 ? "2/2" : "1/2",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                        color: ColorManager.grey3,
                                        fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: ColorManager.whiteColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                goToform2
                                    ? LocaleKeys.addtionalData.tr()
                                    : LocaleKeys.userData.tr(),
                                style: Theme.of(context).textTheme.titleLarge!,
                              ),
                              Row(
                                children: [
                                  Text(
                                    LocaleKeys.NextL.tr(),
                                    style:
                                        Theme.of(context).textTheme.titleLarge!,
                                  ),
                                  Text(
                                    goToform2
                                        ? LocaleKeys.send.tr()
                                        : LocaleKeys.addtionalData.tr(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(color: ColorManager.grey3),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: ColorManager.whiteColor,
                        height: 5,
                        child: Container(
                          width: goToform2
                              ? MediaQuery.of(context).size.width
                              : MediaQuery.of(context).size.width * .5,
                          color: ColorManager.mainColor,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: Text(
                          LocaleKeys.contactsWithUs.tr(),
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: ColorManager.mainColor,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      // check to show any form
                      goToform2 ? const LoginForm2() : const LoginForm1(),
                    ],
                  ),
                ),
              );
      },
      listener: (context, state) {},
    );
  }
}

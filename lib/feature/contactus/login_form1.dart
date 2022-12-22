import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solutionsby42task/feature/contactus/widget/form_button.dart';

import 'package:solutionsby42task/feature/contactus/widget/from_filed.dart';

import '../../core/appbloc/app_bloc.dart';
import '../../core/appbloc/app_events.dart';
import '../../core/util/resources/color_manager.dart';
import '../../translations/locale_keys.g.dart';

class LoginForm1 extends StatefulWidget {
  const LoginForm1({super.key});

  @override
  State<LoginForm1> createState() => _LoginForm1State();
}

class _LoginForm1State extends State<LoginForm1> {
  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _mobileNumberController = TextEditingController();

  final loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginFormKey,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.firstName.tr(),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: ColorManager.mainColor),
              ),
              MyTextFormField(
                controller: _firstNameController,
                hint: LocaleKeys.enterFirstName.tr(),
                error: "${LocaleKeys.necessary} ${LocaleKeys.firstName}",
                textInputAction: TextInputAction.next,
                validator: (value) {
                  return value!.isEmpty
                      ? "${LocaleKeys.necessary} ${LocaleKeys.firstName}"
                      : null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                LocaleKeys.lastName.tr(),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: ColorManager.mainColor),
              ),
              MyTextFormField(
                controller: _lastNameController,
                hint: LocaleKeys.enterLastName.tr(),
                error: "${LocaleKeys.necessary} ${LocaleKeys.lastName}",
                textInputAction: TextInputAction.next,
                validator: (value) {
                  return value!.isEmpty
                      ? "${LocaleKeys.necessary} ${LocaleKeys.lastName}"
                      : null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                LocaleKeys.emailNotCorrect.tr(),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: ColorManager.mainColor),
              ),
              MyTextFormField(
                controller: _emailController,
                hint: "example@example.com",
                error: LocaleKeys.emailNotCorrect.tr(),
                textInputAction: TextInputAction.next,
                textDir: false,
                validator: (value) {
                  bool check = RegExp(
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                      .hasMatch(value!);
                  if (check == false) {
                    return LocaleKeys.emailNotCorrect.tr();
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                LocaleKeys.mobile.tr(),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: ColorManager.mainColor),
              ),
              MyTextFormField(
                controller: _mobileNumberController,
                hint: "05XXXXXXXX",
                error: LocaleKeys.mobileNotCorrect.tr(),
                textInputAction: TextInputAction.next,
                textDir: false,
                validator: (value) {
                  if (value!.length < 10) {
                    return LocaleKeys.mobileNotCorrect.tr();
                  }
                  if (value.length != 10) {
                    return LocaleKeys.mobileNotCorrect.tr();
                  } else if (value.substring(0, 2) != "05") {
                    return LocaleKeys.mobileNotCorrect.tr();
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 30,
              ),
              MyOutlinedButton(
                onTap: () {
                  final FormState? form = loginFormKey.currentState;
                  if (form!.validate()) {
                    BlocProvider.of<AppBloc>(context).add(FirstFormEndedEvent(
                      firstName: _firstNameController.text,
                      lastName: _lastNameController.text,
                      email: _emailController.text,
                      mobile: _mobileNumberController.text,
                    ));
                  } else {
                  }
                },
                label: LocaleKeys.NextL.tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

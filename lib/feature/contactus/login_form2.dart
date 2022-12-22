import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solutionsby42task/feature/contactus/widget/bottom_sheet.dart';
import 'package:solutionsby42task/feature/contactus/widget/form_button.dart';
import 'package:solutionsby42task/feature/contactus/widget/from_filed.dart';
import 'package:solutionsby42task/translations/locale_keys.g.dart';

import '../../core/appbloc/app_bloc.dart';
import '../../core/appbloc/app_events.dart';
import '../../core/util/resources/color_manager.dart';
import 'package:image_picker/image_picker.dart';

class LoginForm2 extends StatefulWidget {
  const LoginForm2({super.key});

  @override
  State<LoginForm2> createState() => _LoginForm2State();
}

class _LoginForm2State extends State<LoginForm2> {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _descraptionController = TextEditingController();

  final TextEditingController _typeController = TextEditingController();

  String base64string = "";
  XFile? image;

  final loginFormKey = GlobalKey<FormState>();

  Future pickImage() async {
    await ImagePicker().pickImage(source: ImageSource.gallery);
  }

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
                LocaleKeys.messageTitle.tr(),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: ColorManager.mainColor),
              ),
              MyTextFormField(
                controller: _titleController,
                hint: LocaleKeys.Enquiry.tr(),
                error:
                    "${LocaleKeys.necessary.tr()} ${LocaleKeys.messageTitle.tr()}",
                textInputAction: TextInputAction.next,
                validator: (value) {
                  return value!.isEmpty
                      ? "${LocaleKeys.necessary.tr()} ${LocaleKeys.messageTitle.tr()}"
                      : null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                LocaleKeys.messageType.tr(),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: ColorManager.mainColor),
              ),
              MyTextFormField(
                controller: _typeController,
                hint: LocaleKeys.messageType.tr(),
                error:
                    "${LocaleKeys.necessary.tr()} ${LocaleKeys.messageType.tr()}",
                textInputAction: TextInputAction.none,
                type: TextInputType.none,
                suffixIcon: const Icon(
                  Icons.arrow_drop_down,
                  color: ColorManager.mainColor,
                ),
                onTap: () {
                  Scaffold.of(context).showBottomSheet<void>(
                    (BuildContext context) {
                      return Container(
                        color: ColorManager.whiteColor,
                        child: const Center(
                          child: MyBottomSheet(),
                        ),
                      );
                    },
                  );
                },
                validator: (value) {
                  return AppBloc.get(context).requestType.isEmpty
                      ? "${LocaleKeys.necessary.tr()} ${LocaleKeys.messageType.tr()}"
                      : null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                LocaleKeys.contentMessage.tr(),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: ColorManager.mainColor),
              ),
              MyTextFormField(
                controller: _descraptionController,
                hint: LocaleKeys.contentMessage.tr(),
                error:
                    "${LocaleKeys.necessary.tr()} ${LocaleKeys.contentMessage.tr()}",
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (_descraptionController.text.isEmpty) {
                    return "${LocaleKeys.necessary.tr()} ${LocaleKeys.contentMessage.tr()}";
                  }
                },
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                LocaleKeys.OptionalAttachments.tr(),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: ColorManager.mainColor),
              ),
              InkWell(
                onTap: () async {
                  image = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);

                  Uint8List imagebytes =
                      await image!.readAsBytes(); //convert to bytes
                  base64string = base64.encode(imagebytes);
                  print(base64string);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 7,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorManager.grey2,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Text(LocaleKeys.AttachPhoto.tr()),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              MyOutlinedButton(
                onTap: () {
                  final FormState? form = loginFormKey.currentState;
                  if (form!.validate()) {
                    BlocProvider.of<AppBloc>(context).add(
                      SendRequestToApiEvent(
                        messageTitle: _titleController.text,
                        messageDesc: _descraptionController.text,
                        messageType: AppBloc.get(context).requestType,
                        attachment: "",
                      ),
                    );
                  }
                },
                label: LocaleKeys.send.tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

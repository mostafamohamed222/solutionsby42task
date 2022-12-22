import 'package:flutter/material.dart';

import '../../../core/util/resources/color_manager.dart';


class MyTextFormField extends StatefulWidget {
  final String? hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  TextEditingController? controller;
  final TextInputType type;
  String? error;
  FormFieldValidator<String>? validator;
  final bool isPassword;
  bool textDir;
  final bool readOnly;
  final bool enabled;
  final TextInputAction? textInputAction;
  final VoidCallback? onSubmit;
  FocusNode myFocusNode = FocusNode();
  GestureTapCallback? onTap;
  ValueChanged<String>? onChanged;

  MyTextFormField({
    Key? key,
    this.hint,
    this.textDir=true,
    this.controller,
    this.type = TextInputType.text,
    this.error,
    this.enabled = true,
    this.validator,
    this.isPassword = false,
    this.readOnly = false,
    this.textInputAction,
    this.prefixIcon,
    this.suffixIcon,
    this.onSubmit,
    this.onTap,
    this.onChanged,
  }) : super(key: key);

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  bool isVisible = false;

  void _requestFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(widget.myFocusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.myFocusNode,
      enabled: widget.enabled,
      onTap: widget.onTap ?? _requestFocus,
      readOnly: widget.readOnly,
      textInputAction: widget.textInputAction,
      obscureText: widget.isPassword,
      controller: widget.controller,
      onChanged: widget.onChanged,
      onEditingComplete: () {
        widget.onSubmit?.call();
        widget.myFocusNode.unfocus();
      },
      style: Theme.of(context).textTheme.labelMedium!.copyWith(
            color: ColorManager.blackColor,
          ),
      keyboardType: widget.type,
      cursorColor: ColorManager.primaryColor,
      validator: widget.validator ??
          (value) {
            if (value!.isEmpty && widget.error != null) {
              return '${"formErrorMessage"} ${widget.error}';
            }

            return null;
          },
      decoration: InputDecoration(
        fillColor: ColorManager.mainContainerDarkBlue,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        errorStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: ColorManager.errorColor,
            ),
        hintText: widget.hint,
        hintTextDirection: widget.textDir? TextDirection.rtl : TextDirection.ltr,
        hintStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: widget.myFocusNode.hasFocus
                  ? ColorManager.primaryColor
                  : ColorManager.dropDownLineColor,
            ),
        isDense: true,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: ColorManager.primaryColor),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: ColorManager.dropDownLineColor),
        ),
      ),
    );
  }

  @override
  void dispose() {
    widget.myFocusNode.dispose();
    super.dispose();
  }
}

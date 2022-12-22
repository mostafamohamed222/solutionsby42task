import 'package:flutter/material.dart';
import 'package:solutionsby42task/core/appbloc/app_bloc.dart';
import 'package:solutionsby42task/feature/contactus/widget/form_button.dart';

import '../../../core/util/resources/color_manager.dart';

class MyBottomSheet extends StatefulWidget {
  const MyBottomSheet({super.key});

  @override
  State<MyBottomSheet> createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  bool choose1 = false;
  bool choose2 = false;
  bool choose3 = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              InkWell(
                child: Text(
                  "اغلاق",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 18),
                ),
                onTap: () {
                  AppBloc.get(context).requestType="";
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                width: 50,
              ),
              Text(
                "اختر نوع الرسالة",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 24, fontWeight: FontWeight.bold),
              )
            ],
          ),
          const Divider(
            color: ColorManager.grey2,
            height: 5,
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width * .82,
            height: 80,
            decoration: BoxDecoration(
              border: Border.all(
                color: ColorManager.grey2,
                width: 2,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("شكوي",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 24, fontWeight: FontWeight.bold)),
                  InkWell(
                    onTap: () {
                      choose1 = true;
                      choose2 = false;
                      choose3 = false;
                      AppBloc.get(context).requestType="شكوي";
                      setState(() {});
                    },
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: !choose1
                            ? ColorManager.whiteColor
                            : ColorManager.mainColor,
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: ColorManager.grey2,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width * .82,
            height: 80,
            decoration: BoxDecoration(
              border: Border.all(
                color: ColorManager.grey2,
                width: 2,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("اقتراح",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 24, fontWeight: FontWeight.bold)),
                  InkWell(
                    onTap: () {
                      choose2 = true;
                      choose1 = false;
                      choose3 = false;
                      AppBloc.get(context).requestType="اقتراح";
                      setState(() {});
                    },
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: !choose2
                            ? ColorManager.whiteColor
                            : ColorManager.mainColor,
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: ColorManager.grey2,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width * .82,
            height: 80,
            decoration: BoxDecoration(
              border: Border.all(
                color: ColorManager.grey2,
                width: 2,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("استفسار",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 24, fontWeight: FontWeight.bold)),
                  InkWell(
                    onTap: () {
                      choose3 = true;
                      choose2 = false;
                      choose1 = false;
                      AppBloc.get(context).requestType="استفسار";
                      setState(() {});
                    },
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: !choose3
                            ? ColorManager.whiteColor
                            : ColorManager.mainColor,
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: ColorManager.grey2,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          MyOutlinedButton(
              onTap: () {
                Navigator.pop(context);
              },
              label: "اختر"),
        ],
      ),
    );
  }
}

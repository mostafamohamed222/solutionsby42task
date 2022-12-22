import 'package:flutter/material.dart';
import 'package:solutionsby42task/core/util/resources/assets_manager.dart';
import 'package:solutionsby42task/core/util/resources/color_manager.dart';

class SendRequestPage extends StatefulWidget {
  const SendRequestPage({super.key, required this.id});
  final String id;

  @override
  State<SendRequestPage> createState() => _SendRequestPageState();
}

class _SendRequestPageState extends State<SendRequestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(AssetsManager.logoPNG),
        backgroundColor: ColorManager.mainColor,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "تم ارسال الطلب بنجاح",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              "رقم الطلب ${widget.id}",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(),
            ),
            const Icon(
              Icons.check_circle_outline,
              size: 50,
              color: ColorManager.greenColor,
            ),
          ],
        ),
      ),
    );
  }
}

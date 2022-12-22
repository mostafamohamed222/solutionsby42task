import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:solutionsby42task/feature/mediacenter_screen/widget/widgetNews.dart';

import '../../core/appbloc/app_bloc.dart';
import '../../core/appbloc/app_state.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppState>(
      builder: (context, state) {
        return Expanded(
          // list view to show all news in this screen
          child: ListView.builder(
            itemBuilder: (context, index) {
              return WidgetNews(
                news: AppBloc.get(context).news[index],
              );
            },
            itemCount: AppBloc.get(context).news.length,
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}

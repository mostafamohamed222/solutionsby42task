import 'package:solutionsby42task/models/newsmodel.dart';

abstract class AppState {}

class InitialState extends AppState {}

class GetNewsDataFromAPIState extends AppState {}

class SuccessGetNewsDataFromAPIState extends AppState {}

class SuccessSendRequestToAPIState extends AppState {
  String id;
  SuccessSendRequestToAPIState({required this.id});
}

class LoadingSendRequestToAPIState extends AppState {}

class SuccessChangeLangState extends AppState {
  String newLang;
  SuccessChangeLangState({required this.newLang});
}

class SuccessToggleNavBarState extends AppState {
  int index;
  SuccessToggleNavBarState({required this.index});
}

class SuccessSlecteNewsState extends AppState {
  NewsModel news;
  SuccessSlecteNewsState({required this.news});
}

class BackToFirstFormState extends AppState {}

class GoToSecondFormState extends AppState {}

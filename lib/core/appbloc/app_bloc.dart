import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solutionsby42task/core/appbloc/app_events.dart';
import 'package:solutionsby42task/core/appbloc/app_state.dart';
import 'package:solutionsby42task/core/network/diohelper.dart';
import 'package:solutionsby42task/models/newsmodel.dart';
import 'package:solutionsby42task/models/request_model.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(InitialState()) {
    on<GetNewsEvent>(_getNewsList);
    on<ToggleInNavBarEvent>(_changeIndex);
    on<ChangeLanguageEvent>(_changeLanguage);
    on<SelectNewSEvent>(_selectNews);
    on<FirstFormEndedEvent>(_goTOSecondForm);
    on<SendRequestToApiEvent>(_sendRequestToAPI);
    on<BackToFirstFormEvent>(_backToFirstForm);
  }

  // some fields need in app to pass some data
  int myIndex = 4;
  List<NewsModel> news = [];
  String language = 'ar';
  late RequestModel request;
  String requestType = "";
  String firstName = "";
  String lastName = "";
  String email = "";
  String mobile = "";

  static get(BuildContext context) => BlocProvider.of<AppBloc>(context);

  // Get  News Data from API
  FutureOr<void> _getNewsList(
      GetNewsEvent event, Emitter<AppState> emit) async {
    // Loading State
    emit(GetNewsDataFromAPIState());
    // Get data form api
    var value =
        await DioHelper.getNews(url: "news", values: {"page": 1, "limit": 7});
    // try to pares Data
    for (var x in value.data) {
      news.add(NewsModel.fromJson(x));
    }
    // end state
    emit(SuccessGetNewsDataFromAPIState());
  }

  // change Index in NavBar
  FutureOr<void> _changeIndex(
      ToggleInNavBarEvent event, Emitter<AppState> emit) async {
    myIndex = event.index;
    emit(SuccessToggleNavBarState(index: myIndex));
  }

  // change Language in NavBar
  FutureOr<void> _changeLanguage(
      ChangeLanguageEvent event, Emitter<AppState> emit) async {
    if (language == 'ar') {
      language = 'en';
    } else {
      language = 'ar';
    }
    // set New Language
    await event.context.setLocale(Locale(language));
    emit(SuccessChangeLangState(newLang: language));
  }
  // select news and send it in state
  FutureOr<void> _selectNews(SelectNewSEvent event, Emitter<AppState> emit) {
    emit(SuccessSlecteNewsState(news: event.news));
  }
  // go to second form and save data in bloc fields
  FutureOr<void> _goTOSecondForm(
      FirstFormEndedEvent event, Emitter<AppState> emit) {
    firstName = event.firstName;
    lastName = event.lastName;
    mobile = event.mobile;
    email = event.email;
    emit(GoToSecondFormState());
  }

  // send request To APi 
  FutureOr<void> _sendRequestToAPI(
      SendRequestToApiEvent event, Emitter<AppState> emit) async {
    emit(LoadingSendRequestToAPIState());

    // make a request
    var value = await DioHelper.postRequest(url: "contactus", values: {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "mobile": mobile,
      "messageTitle": event.messageTitle,
      "messageType": event.messageType,
      "messageDesc": event.messageDesc,
      "attachment": event.attachment?? "",
    });
    // pass id with state to show it in send request page
    emit(SuccessSendRequestToAPIState(
      id: value.data["id"],
    ));
  }
  // use it when try to back from form 2 to form 1
  FutureOr<void> _backToFirstForm(
      BackToFirstFormEvent event, Emitter<AppState> emit) {
    emit(BackToFirstFormState());
  }
}

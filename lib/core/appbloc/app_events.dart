import 'package:flutter/cupertino.dart';
import 'package:solutionsby42task/models/newsmodel.dart';

abstract class AppEvent {}
// use it to get news data
class GetNewsEvent extends AppEvent {}
//use it when want to change language
class ChangeLanguageEvent extends AppEvent {
  BuildContext context;
  ChangeLanguageEvent({required this.context});
}

// use it when new to select news to show it in single news page
class SelectNewSEvent extends AppEvent {
  NewsModel news;
  SelectNewSEvent({required this.news});
}

// use it when send request to API and send data and use remain data from bloc fields
class SendRequestToApiEvent extends AppEvent {
  String messageTitle;
  String messageType;
  String messageDesc;
  String? attachment;
  SendRequestToApiEvent({
    required this.messageTitle,
    required this.messageType,
    required this.messageDesc,
    this.attachment,
  });
}

// use it when first form end and send data to save in bloc fields
class FirstFormEndedEvent extends AppEvent {
  String firstName;
  String lastName;
  String email;
  String mobile;
  FirstFormEndedEvent({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobile,
  });
}
// use it when need to toggle in nav bar and send new index to change it
class ToggleInNavBarEvent extends AppEvent {
  int index;
  ToggleInNavBarEvent({required this.index});
}
// use it when back to form 1 
class BackToFirstFormEvent extends AppEvent {}

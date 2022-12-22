class RequestModel {
  String firstName;
  String lastName;
  String email;
  String mobile;
  String messageTitle;
  String messageType;
  String messageDesc;
  String? attachment;

  RequestModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobile,
    required this.messageTitle,
    required this.messageType,
    required this.messageDesc,
    this.attachment,
  });

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'mobile': mobile,
      'messageTitle': messageTitle ,
      'messageType':  messageType,
      'messageDesc': messageDesc,
      'attachment': attachment??"",
    };
  }
}

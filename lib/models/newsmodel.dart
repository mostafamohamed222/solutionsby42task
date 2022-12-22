import 'package:easy_localization/easy_localization.dart';

class NewsModel {
  String createdAt;
  String titleAr;
  String titleEn;
  String contentAr;
  String contentEn;
  String image;
  String id;

  NewsModel({
    required this.createdAt,
    required this.titleAr,
    required this.titleEn,
    required this.contentAr,
    required this.contentEn,
    required this.image,
    required this.id,
  });

  String getDataTime() {
    DateTime parseDate =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(createdAt);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('MM/dd/yyyy');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
        createdAt: json["createdAt"],
        titleAr: json["title_ar"],
        titleEn: json["title_en"],
        contentAr: json["content_ar"],
        contentEn: json["content_en"],
        image: json["image"],
        id: json["id"]);
  }
}

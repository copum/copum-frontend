import 'package:intl/intl.dart';

class AnswerModel {
  late int? question_id;
  late String title;
  late String content;
  late String? answer_created_at;
  late String? image;
  Map<String, dynamic>? Author;

  AnswerModel({
    question_id,
    title,
    content,
    answer_created_at,
    image,
    Author,
  });

  AnswerModel.fromJson(Map<String, dynamic> json) {
    question_id = json['question'];
    title = json['Answer_title'];
    content = json["Answer_content"];
    DateTime createdDate = DateTime.parse(json["Answer_created_at"]);
    answer_created_at = DateFormat('yyyy.MM.dd').format(createdDate);
    image = json['Answer_image'];
    Author = json['Author'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question'] = question_id;
    data['Answer_title'] = title;
    data['Answer_content'] = content;
    data['Answer_created_at'] = answer_created_at;
    data['Answer_image'] = image;
    data['Author'] = Author;

    return data;
  }
}

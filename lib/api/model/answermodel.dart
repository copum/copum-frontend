import 'package:copum/screen/tmp.dart';

class AnswerModel {
  late String title;
  late String content;
  late String? answer_created_at;
  late String? image;
  // late int answerCounting;

  //테스트 모델

  // late String user_id;
  // late String email;

  AnswerModel({
    title,
    content,
    answer_created_at,
    image,
  });

  AnswerModel.fromJson(Map<String, dynamic> json) {
    title = json['Answer_title'];
    content = json["Answer_content"];
    answer_created_at = json['Answer_created_at'];
    image = json['Answer_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Answer_title'] = title;
    data['Answer_content'] = content;
    data['Answer_created_at'] = answer_created_at;
    data['Answer_image'] = image;

    return data;
  }
}

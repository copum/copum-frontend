import 'dart:ui';

import 'package:intl/intl.dart';

class BoardModel {
  late int pk;
  late String title;
  late String content;
  int? category1;
  int? category2;
  int? category3;
  int? category4;
  late Map<String, dynamic> Author;
  late int questionCounting;
  late int answerCounting;
  late String? image;
  late String question_created_at;
  // late int answerCounting;

  //테스트 모델

  // late String user_id;
  // late String email;

  BoardModel(
      {pk,
      title,
      category1,
      category2,
      category3,
      category4,
      content,
      questionCounting,
      answerCounting,
      image,
      Author,
      // answerCounting
      question_created_at});
  // BoardModel({user_id, email});

  BoardModel.fromJson(Map<String, dynamic> json) {
    pk = json['pk'];
    title = json['Question_title'];
    category1 = json['Question_category1'];
    category2 = json['Question_category2'];
    category3 = json['Question_category3'];
    category4 = json['Question_category4'];
    content = json["Question_content"];
    questionCounting = json['Question_counting'];
    image = json['Question_image'];
    answerCounting = json['answers_count'];
    Author = json['Author'];
    DateTime createdDate = DateTime.parse(json["Question_created_at"]);
    question_created_at = DateFormat('yyyy.MM.dd').format(createdDate);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Question_title'] = title;
    data['Question_category1'] = category1;
    data['Question_category2'] = category2;
    data['Question_category3'] = category3;
    data['Question_category4'] = category4;
    data['Question_content'] = content;
    // data['Question_counting'] = questionCounting;
    data['Question_image'] = image;
    // data['answers_count'] = answerCounting;
    data['Author'] = Author;

    // data['search_title'] = user_id;
    // data['email'] = email;

    return data;
  }
}

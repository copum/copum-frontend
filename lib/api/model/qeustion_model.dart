import 'package:flutter/material.dart';
import 'package:get/get_connect.dart';

class QuestionModel {
  late String Question_title;
  late String? Question_image;
  late int? Author_id;
  late String Question_content;
  late String? Question_category1;
  late String? Question_category2;
  late String? Question_category3;
  late String? Question_category4;
  late String? Question_created_at;
  late int Question_counting;

  QuestionModel({
    Question_title,
    // Question_image,
    Question_content,
    Question_category1,
    Question_category2,
    Question_category3,
    Question_category4,
    Question_created_at,
    Question_counting,
  });

  QuestionModel.fromJson(Map<String, dynamic> json) {
    Question_title = json['Question_title'];
    Question_content = json["Question_content"];
    Question_category1 = json['Question_category1'];
    Question_category2 = json['Question_category2'];
    Question_category3 = json['Question_category3'];
    Question_category4 = json['Question_category4'];
    Question_created_at = json['Question_created_at'];
    Question_counting = json['Question_created_at'];
    Question_image = json['Question_image'];
    Question_counting = json['Question_counting'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Question_title'] = Question_title;
    data['Question_content'] = Question_content;
    data['Question_category1'] = Question_category1;
    data['Question_category2'] = Question_category2;
    data['Question_category3'] = Question_category3;
    data['Question_category4'] = Question_category4;
    data['Question_image'] = Question_image;
    data['Question_created_at'] = Question_created_at;
    data['Question_counting'] = Question_counting;

    return data;
  }
}

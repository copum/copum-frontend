import 'package:copum/screen/tmp.dart';

class BoardModel {
  // late int? id;
  late String title;
  late String? category1;
  late String? category2;
  late String? category3;
  late String? category4;
  late String content;
  late int questionCounting;
  late String? image;
  late int answerCounting;

  //테스트 모델

  // late String user_id;
  // late String email;

  BoardModel(
      {title,
      category1,
      category2,
      category3,
      category4,
      content,
      questionCounting,
      image,
      answerCounting});
  // BoardModel({user_id, email});

  BoardModel.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    title = json['Question_title'];
    category1 = json['Question_category1_id'];
    category2 = json['Question_category2_id'];
    category3 = json['Question_category3_id'];
    category4 = json['Question_category4_id'];
    content = json["Question_content"];
    questionCounting = json['Question_counting'];
    image = json['Question_image'];
    answerCounting = json['answers_count'];

    //   user_id = json['search_title'];
    //   email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['id'] = id;
    data['Question_title'] = title;
    data['Question_category1_id'] = category1;
    data['Question_category2_id'] = category2;
    data['Question_category3_id'] = category3;
    data['Question_category4_id'] = category4;
    data['Question_content'] = content;
    data['Question_counting'] = questionCounting;
    data['Question_image'] = image;
    data['answers_count'] = answerCounting;

    // data['search_title'] = user_id;
    // data['email'] = email;

    return data;
  }
}

class BoardModel {
  late int pk;
  late String title;
  late String content;
  int? category1;
  int? category2;
  int? category3;
  int? category4;
  int? Author_id;
  late int questionCounting;
  late int answerCounting;
  late String? image;
  // late int answerCounting;

  //테스트 모델

  // late String user_id;
  // late String email;

  BoardModel({
    pk,
    title,
    category1,
    category2,
    category3,
    category4,
    content,
    questionCounting,
    answerCounting,
    image,
    Author_id,
    // answerCounting
  });
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
    Author_id = json['Author_id'];
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
    data['Author_id'] = Author_id;

    // data['search_title'] = user_id;
    // data['email'] = email;

    return data;
  }
}

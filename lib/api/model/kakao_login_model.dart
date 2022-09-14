class KakaoLoginModel {
  late bool error;
  late String message;
  late String email;

  KakaoLoginModel(
      {required this.error, required this.message, required this.email});

  KakaoLoginModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    email = json['email'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['message'] = message;
    data['email'] = email;
    return data;
  }
}

// test model

class Test {
  String title;
  //late List<String> candidates;
  String content;

  Test({required this.title, required this.content});

  Map<String, dynamic> toJson() => {
        'title': title,
        'content': content,
      };

  Test.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        // candidates = json['body'].toString().split('/'),
        content = json['content'];
}

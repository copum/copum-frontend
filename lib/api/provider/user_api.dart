import 'dart:convert';

import 'package:copum/api/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:io' show Platform;

import 'package:kakao_flutter_sdk/kakao_flutter_sdk_talk.dart';

// const answerUrl = 'http://10.0.2.2:8000/answer/'; //게시판 android
// const answerUrl = 'http://127.0.0.1:8000/answer/'; //게시판 ios
// const boardUrl = 'http://localhost:8000/question/';

String userUrl = Platform.isAndroid
    ? 'http://10.0.2.2:8000/list/'
    : 'http://127.0.0.1:8000/list/';

class UserApiClient {
  final http.Client httpClient;
  UserApiClient({required this.httpClient});

  setUser(user) {}

  dynamic fetchUserData() async {
    try {
      http.Response response = await http.get(Uri.parse(userUrl));
      // List<dynamic> body = json.decode(response.body);
      List<dynamic> body = jsonDecode(utf8.decode(response.bodyBytes));
      var userModel =
          body.map((dynamic item) => UserModel.fromJson(item)).toList();

      return userModel;
      //return ResponseModel(boardModel: boardModel);
    } catch (e) {
      //return ResponseModel(exception: e as Exception);
      return null;
    }
  }
}

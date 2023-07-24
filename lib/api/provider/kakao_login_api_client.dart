import 'dart:convert';
import 'dart:developer';
import 'package:copum/api/model/boardmodel.dart';
import 'package:copum/api/model/kakao_login_model.dart';
import 'package:copum/api/model/user_model.dart';
import 'package:copum/api/repository/kakao_login_repository.dart';
import 'package:copum/router/routes.dart';
import 'package:copum/screen/login_screen.dart';
import 'package:copum/screen/home_screen.dart';
import 'package:copum/widget/password_hint.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:copum/main.dart';
import 'dart:io' show Platform;

import 'package:path/path.dart';

import '../../controller/user_controller.dart';

//애뮬레이터에서 돌릴때 10.0.2.2 아닐땐 실제 url 사용
// const baseUrl = 'http://10.0.2.2:8000/account/kakao/login'; //카카오 android
// const baseUrl = 'http://127.0.0.1:8000/account/kakao/login'; //카카오 ios
// const baseUrl = 'http://localhost:8000/account/kakao/login';

String baseUrl = Platform.isAndroid
    ? 'http://10.0.2.2:8000/users/login/kakao'
    : 'http://127.0.0.1:8000/users/login/kakao';

class CopumApiClient {
  final http.Client httpClient;
  CopumApiClient({required this.httpClient});
  var userModel;

  kakaoLogin(String token) async {
    try {
      final url = Uri.parse("$baseUrl?AccessToken=$token");

      http.Response response = await httpClient.post(url);
      var test = jsonDecode(utf8.decode(response.bodyBytes));
      var user_response = test["user"];
      UserController userController = UserController();
      Get.put(userController);
      var controller = Get.find<UserController>();
      // controller.fetchUserData(user_response);

      if (response.statusCode == 200) {
        var result = jsonDecode(utf8.decode(response.bodyBytes));
        return result;
      } else
        print('error');
    } catch (e) {
      //print('error: ${e.toString()}');
    }
  }
}

// class GoogleLoginApiClient {
//   late final http.Client httpClient;
//   GoogleLoginApiClient({required this.httpClient});

//   googleLogin(String accessToken) async {
//     try {
//       final url = Uri.parse(
//           'http://10.0.2.2:8000/account/google/login?access_token=$accessToken');

//       var response = await httpClient.get(url);

//       if (response.statusCode == 200) {
//         final result = jsonDecode(response.body);
//       }
//     } catch (e) {}
//   }
// }

// 게시판 테스트 api 파싱

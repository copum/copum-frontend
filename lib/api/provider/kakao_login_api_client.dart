import 'dart:convert';
import 'dart:developer';
import 'package:copum/api/model/boardmodel.dart';
import 'package:copum/api/model/kakao_login_model.dart';
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

//애뮬레이터에서 돌릴때 10.0.2.2 아닐땐 실제 url 사용
// const baseUrl = 'http://10.0.2.2:8000/account/kakao/login'; //카카오 android
// const baseUrl = 'http://127.0.0.1:8000/account/kakao/login'; //카카오 ios
// const baseUrl = 'http://localhost:8000/account/kakao/login';

String baseUrl = Platform.isAndroid
    ? 'http://10.0.2.2:8000/question/'
    : 'http://127.0.0.1:8000/question/';

class CopumApiClient {
  final http.Client httpClient;
  CopumApiClient({required this.httpClient});

  kakaoLogin(String token) async {
    try {
      final url = Uri.parse('$baseUrl?access_token=$token');
      print('$url');

      var response = await httpClient.get(url);
      print('$response');
      if (response.statusCode == 200) {
        final result = jsonDecode(utf8.decode(response.bodyBytes));
        print('$result');
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

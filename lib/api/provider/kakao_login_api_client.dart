import 'dart:convert';
import 'dart:ffi';
import 'package:copum/api/model/kakao_login_model.dart';
import 'package:copum/api/repository/kakao_login_repository.dart';
import 'package:copum/router/routes.dart';
import 'package:copum/screen/login_screen.dart';
import 'package:copum/screen/root.dart';
import 'package:copum/widget/password_hint.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

//애뮬레이터에서 돌릴때 10.0.2.2 아닐땐 실제 url 사용
const baseUrl = 'http://10.0.2.2:8000/account/kakao/login';

class KakaoLoginApiClient {
  final http.Client httpClient;
  KakaoLoginApiClient({required this.httpClient});

  kakaoLogin(String token) async {
    try {
      final url = Uri.parse('$baseUrl?access_token=$token');
      print('$url');

      var response = await httpClient.get(url);
      print('$response');
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        print('$result');
        return result;
      } else
        print('error');
    } catch (e) {
      print('error: ${e.toString()}');
    }
  }
}

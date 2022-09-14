import 'dart:convert';
import 'package:copum/api/model/boardmodel.dart';
import 'package:copum/api/model/response_model.dart';
import 'package:copum/api/provider/kakao_login_api_client.dart';
import 'package:copum/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:http/http.dart' as http;

class BoardApiClient {
  final http.Client httpClient;
  BoardApiClient({required this.httpClient});

  dynamic fetchData() async {
    try {
      http.Response response = await http.get(Uri.parse(boardUrl));
      List<dynamic> body = json.decode(response.body);
      var boardModel =
          body.map((dynamic item) => BoardModel.fromJson(item)).toList();
      //throw Exception('test exception');
      return boardModel;
      //return ResponseModel(boardModel: boardModel);
    } catch (e) {
      //return ResponseModel(exception: e as Exception);
      return null;
    }
  } // 브레이크 포인트 여기서 멈춤 , 스크린 화면으로 데이터가 안넘어옴 , 여기까지는 데이터가 잘 넘어옴
}

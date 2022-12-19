import 'dart:convert';
import 'package:copum/api/model/boardmodel.dart';
import 'package:copum/api/model/response_model.dart';
import 'package:copum/api/provider/kakao_login_api_client.dart';
import 'package:copum/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_quill/flutter_quill.dart';
import 'package:copum/api/model/answermodel.dart';
import 'dart:io' show Platform;

// const answerUrl = 'http://10.0.2.2:8000/answer/'; //게시판 android
// const answerUrl = 'http://127.0.0.1:8000/answer/'; //게시판 ios
// const boardUrl = 'http://localhost:8000/question/';

String answerUrl = Platform.isAndroid
    ? 'http://10.0.2.2:8000/answer/'
    : 'http://127.0.0.1:8000/answer/';

class AnswerApiClient {
  final http.Client httpClient;
  AnswerApiClient({required this.httpClient});

  dynamic answerFetchData() async {
    try {
      http.Response response = await http.get(Uri.parse(answerUrl));
      // List<dynamic> body = json.decode(response.body);
      List<dynamic> body = jsonDecode(utf8.decode(response.bodyBytes));
      var answerModel =
          body.map((dynamic item) => AnswerModel.fromJson(item)).toList();

      return answerModel;
      //return ResponseModel(boardModel: boardModel);
    } catch (e) {
      //return ResponseModel(exception: e as Exception);
      return null;
    }
  }
}


      // var boardModel = QuillController(
      //     document: Document.fromJson(body),
      //     selection: TextSelection.collapsed(offset: 0));
      //throw Exception('test exception');

      // List<BoardModel> boardModel = body.cast<BoardModel>();
      // List<BoardModel> boardModel =
      //     body.map((e) => BoardModel.fromJson(e)).toList();
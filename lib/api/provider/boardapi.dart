import 'dart:convert';
import 'package:copum/api/model/boardmodel.dart';
import 'package:copum/api/model/response_model.dart';
import 'package:copum/api/provider/kakao_login_api_client.dart';
import 'package:copum/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_quill/flutter_quill.dart';
import 'dart:io' show Platform;

// const boardUrl = 'http://10.0.2.2:8000/question/'; //게시판
// const boardUrl = 'http://localhost:8000/question/';
String boardUrl = Platform.isAndroid
    ? 'http://10.0.2.2:8000/question/'
    : 'http://127.0.0.1:8000/question/';

class BoardApiClient {
  final http.Client httpClient;
  BoardApiClient({required this.httpClient});

  dynamic fetchData() async {
    try {
      http.Response response = await http.get(Uri.parse(boardUrl));
      // List<dynamic> body = json.decode(response.body);
      List<dynamic> body = jsonDecode(utf8.decode(response.bodyBytes));
      var boardModel =
          body.map((dynamic item) => BoardModel.fromJson(item)).toList();

      return boardModel;
      //return ResponseModel(boardModel: boardModel);
    } catch (e) {
      //return ResponseModel(exception: e as Exception);
      return null;
    }
  }

  dynamic search(String search) async {
    try {
      String searchUrl = boardUrl + "?search=${search}";
      http.Response response = await http.get(Uri.parse(searchUrl));
      List<dynamic> body = jsonDecode(utf8.decode(response.bodyBytes));
      var boardModel =
          body.map((dynamic item) => BoardModel.fromJson(item)).toList();
      return boardModel;
    } catch (e) {
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
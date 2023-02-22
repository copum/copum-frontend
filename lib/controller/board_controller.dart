import 'dart:convert';
import 'package:copum/api/provider/kakao_login_api_client.dart';
import 'package:copum/api/repository/board_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../api/model/boardmodel.dart';

class BoardController extends GetxController {
  final BoardRepository repository;
  BoardController({required this.repository});

  var boardModel = [].obs;
  var searchModel = [].obs;

  var _boardModel = BoardModel().obs;
  BoardModel get dataTest => _boardModel.value;

  Future<List> fetchBoard() async {
    boardModel.value = await repository.fetchBoard(); //.value
    var _boardModel = boardModel.value;
    // print('ret: ${boardModel.value}');
    return _boardModel;
  }

  void search(String data) async {
    searchModel.value = await repository.searchBoard(data); //.value
  }

  void clear() {
    searchModel.value = [];
  }

  void insert(
      title, content, Author_id, category1, category2, category3, category4) {
    repository.insertBoard(
        title, content, Author_id, category1, category2, category3, category4);
  }
}

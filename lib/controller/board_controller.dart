import 'dart:convert';
import 'package:copum/api/provider/kakao_login_api_client.dart';
import 'package:copum/api/repository/board_repository.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../api/model/boardmodel.dart';

class BoardController extends GetxController {
  final BoardRepository repository;
  BoardController({required this.repository});

  var boardModel = [].obs;

  // repository.fetchBoard().then((data) {
  //   print('boardList size: ${data?.length}');
  //   boardList = data;
  // });

  void fetchBoard() async {
    boardModel.value = await repository.fetchBoard(); //.value
    // print('ret: ${boardModel.value}');
  }

  void search(String data) async {
    boardModel.value = await repository.searchBoard(data); //.value
  }
}

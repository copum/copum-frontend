import 'dart:convert';
import 'package:copum/api/provider/kakao_login_api_client.dart';
import 'package:copum/api/repository/board_repository.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../api/model/boardmodel.dart';

class BoardController extends GetxController {
  final BoardRepository repository;
  BoardController({required this.repository});

  // repository.fetchBoard().then((data) {
  //   print('boardList size: ${data?.length}');
  //   boardList = data;
  // });

  Future<List<BoardModel>> fetchBoard() async {
    final boardList = await repository.fetchBoard();
    return boardList;
  }
}

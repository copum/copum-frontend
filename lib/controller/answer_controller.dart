import 'dart:convert';
import 'package:copum/api/provider/kakao_login_api_client.dart';
import 'package:copum/api/repository/answer_repository.dart';
import 'package:copum/api/repository/board_repository.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../api/model/boardmodel.dart';

class AnswerController extends GetxController {
  final AnswerRepository repository;
  AnswerController({required this.repository});

  var answerModel = [].obs;

  // repository.fetchBoard().then((data) {
  //   print('boardList size: ${data?.length}');
  //   boardList = data;
  // });

  void fetchBoard() async {
    answerModel.value = await repository.fetchBoard(); //.value
    // print('ret: ${boardModel.value}');
  }

  void insert(title, content, author, image, question) {
    repository.insertBoard(title, content, author, image, question);
  }
}

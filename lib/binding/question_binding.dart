import 'package:copum/api/provider/answerapi.dart';
import 'package:copum/api/provider/boardapi.dart';
import 'package:copum/api/provider/kakao_login_api_client.dart';
import 'package:copum/api/provider/question_api.dart';
import 'package:copum/api/repository/answer_repository.dart';
import 'package:copum/api/repository/board_repository.dart';
import 'package:copum/api/repository/kakao_login_repository.dart';
import 'package:copum/api/repository/question_repository.dart';
import 'package:copum/controller/answer_controller.dart';
import 'package:copum/controller/kakao_login_controller.dart';
import 'package:copum/controller/board_controller.dart';
import 'package:copum/controller/question_controller%20copy.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class QuestionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuestionController>(() {
      return QuestionController(
          repository: QeusitionRepository(
              apiClient: QuestionApiClient(httpClient: http.Client())));
    });
  }
}

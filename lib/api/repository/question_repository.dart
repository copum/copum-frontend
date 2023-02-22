import 'package:copum/api/model/boardmodel.dart';
import 'package:copum/api/provider/answerapi.dart';
import 'package:copum/api/provider/boardapi.dart';
import 'package:copum/api/provider/kakao_login_api_client.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:meta/meta.dart';

import '../provider/question_api.dart';

class QeusitionRepository {
  final QuestionApiClient apiClient;

  QeusitionRepository({required this.apiClient});

  dynamic fetchBoard() {
    return apiClient.questionFetchData();
  }
}

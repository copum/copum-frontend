import 'package:copum/api/provider/boardapi.dart';
import 'package:copum/api/provider/kakao_login_api_client.dart';
import 'package:copum/api/repository/board_repository.dart';
import 'package:copum/api/repository/kakao_login_repository.dart';
import 'package:copum/controller/kakao_login_controller.dart';
import 'package:copum/controller/board_controller.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class BoardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BoardController>(() {
      return BoardController(
          repository: BoardRepository(
              apiClient: BoardApiClient(httpClient: http.Client())));
    });
  }
}

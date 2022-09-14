import 'dart:convert';
import 'package:copum/api/provider/kakao_login_api_client.dart';
import 'package:copum/api/repository/board_repository.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../api/model/boardmodel.dart';

class RootPageController extends GetxController {
  RxInt rootPageIndex = 0.obs;

  void changeRootPageIndex(int index) {
    rootPageIndex(index);
  }
}
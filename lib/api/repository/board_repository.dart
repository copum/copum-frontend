import 'package:copum/api/model/boardmodel.dart';
import 'package:copum/api/provider/boardapi.dart';
import 'package:copum/api/provider/kakao_login_api_client.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:meta/meta.dart';

class BoardRepository {
  final BoardApiClient apiClient;

  BoardRepository({required this.apiClient});

  dynamic fetchBoard() {
    return apiClient.fetchData();
  }

  dynamic insertBoard(
      title, content, Author_id, category1, category2, category3, category4) {
    return apiClient.insert(
        title, content, Author_id, category1, category2, category3, category4);
  }

  dynamic searchBoard(String search) {
    return apiClient.search(search);
  }
}

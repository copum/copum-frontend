import 'package:copum/api/provider/kakao_login_api_client.dart';
import 'package:copum/api/repository/kakao_login_repository.dart';
import 'package:copum/controller/kakao_login_controller.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() {
      return LoginController(
          repository: KakaoLoginRepository(
              apiClient: CopumApiClient(httpClient: http.Client())));
    });
  }
}

import 'package:copum/api/provider/kakao_login_api_client.dart';
import 'package:copum/api/provider/user_api.dart';
import 'package:copum/api/repository/kakao_login_repository.dart';
import 'package:copum/api/repository/user_repository.dart';
import 'package:copum/controller/kakao_login_controller.dart';
import 'package:copum/controller/user_controller.dart';
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
    Get.lazyPut<UserController>(() {
      return UserController(
          repository: UserRepository(
              userApi: UserApiClient(httpClient: http.Client())));
    });
  }
}

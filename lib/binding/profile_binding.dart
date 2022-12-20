import 'package:copum/api/provider/user_api.dart';
import 'package:copum/api/repository/user_repository.dart';
import 'package:copum/controller/user_controller.dart';
import 'package:get/instance_manager.dart';
import 'package:http/http.dart' as http;

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(() {
      return UserController(
          repository: UserRepository(
              userApi: UserApiClient(httpClient: http.Client())));
    });
  }
}

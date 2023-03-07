// import 'package:copum/api/provider/boardapi.dart';
// import 'package:copum/api/provider/kakao_login_api_client.dart';
// import 'package:copum/api/repository/board_repository.dart';
// import 'package:copum/api/repository/kakao_login_repository.dart';
// import 'package:copum/api/repository/user_repository.dart';
// import 'package:copum/controller/kakao_login_controller.dart';
// import 'package:copum/controller/board_controller.dart';
// import 'package:copum/controller/user_controller.dart';
// import 'package:http/http.dart' as http;
// import 'package:get/get.dart';

// import '../api/provider/user_api.dart';

// class UserBinding implements Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<UserController>(() {
//       return UserController(
//           repository: UserRepository(
//               apiClient: UserApiClient(httpClient: http.Client())));
//     });
//   }
// }

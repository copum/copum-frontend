import 'package:copum/api/model/user_model.dart';
import 'package:copum/api/repository/user_repository.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var userModel = UserModel().obs;

  fetchUserData(dynamic data) {
    userModel.value = UserModel.fromJson(data);
  }
}

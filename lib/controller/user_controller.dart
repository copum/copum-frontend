import 'package:copum/api/model/user_model.dart';
import 'package:copum/api/repository/user_repository.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final UserRepository repository;
  UserController({required this.repository});
  var _user = UserModel().obs;

  get user => this._user.value;

  set user(value) => this._user.value = value;
}

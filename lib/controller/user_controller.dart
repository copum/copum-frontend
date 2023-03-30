import 'package:copum/api/model/user_model.dart';
import 'package:copum/api/repository/user_repository.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final UserRepository repository;
  UserController({required this.repository});

  var _user = UserModel().obs;

  UserModel get user => _user.value;

  set user(value) => _user.value;

  var userModel = UserModel().obs;

  var _userModel = UserModel().obs;
  UserModel get dataTest => _userModel.value;

  Future<dynamic> fetchBoard() async {
    userModel.value = await repository.fetchBoard(); //.value
    var _userModel = userModel.value;
    // print('ret: ${boardModel.value}');
    return _userModel;
  }
}

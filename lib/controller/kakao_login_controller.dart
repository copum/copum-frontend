import 'package:copum/api/provider/kakao_login_api_client.dart';
import 'package:copum/api/repository/kakao_login_repository.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_user.dart';

class LoginController extends GetxController {
  final KakaoLoginRepository repository;
  LoginController({required this.repository});

  void checkLogin() async {
    if (await isKakaoTalkInstalled()) {
      try {
        OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
        await UserApi.instance.loginWithKakaoTalk();
        //print('success: ${token.accessToken}');
      } catch (error) {
        //print('fail $error');
      }
      try {
        OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
        await UserApi.instance.loginWithKakaoAccount();
        //print('success ${token.accessToken}');
      } catch (error) {
        //print('fail $error');
      }
    } else {
      try {
        OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
        print('success token: ${token.accessToken}');
        repository.kakaoLogin(token.accessToken);
      } catch (error) {
        //print('fail $error');
      }
    }
  }
}

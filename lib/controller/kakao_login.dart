import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_user.dart';

class KakaoLogin {
  void checkLogin() async {
    if (await isKakaoTalkInstalled()) {
      try {
        OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
        await UserApi.instance.loginWithKakaoTalk();
        print('success ${token.accessToken}');
      } catch (error) {
        //print('fail $error');
      }
      try {
        OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
        await UserApi.instance.loginWithKakaoAccount();
        print('success ${token.accessToken}');
      } catch (error) {
        //print('fail $error');
      }
    } else {
      try {
        OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
        print('success ${token.accessToken}');
      } catch (error) {
        //print('fail $error');
      }
    }
  }
}

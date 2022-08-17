import 'package:kakao_flutter_sdk/kakao_flutter_sdk_user.dart';

class KakaoLogin {
  void _getUserInfo() async {
    try {
      User user = await UserApi.instance.me();
      print('success'
          '\n number: ${user.id}'
          '\n nickname: ${user.kakaoAccount?.profile?.nickname}');
    } catch (error) {
      print('fail $error');
    }
  }

  void checkLogin() async {
    if (await isKakaoTalkInstalled()) {
      try {
        await UserApi.instance.loginWithKakaoTalk();
        print('success');
        _getUserInfo();
      } catch (error) {
        print('fail $error ');
      }

      try {
        await UserApi.instance.loginWithKakaoAccount();
        print('success');
        _getUserInfo();
      } catch (error) {
        print('fail $error');
      }
    } else {
      try {
        await UserApi.instance.loginWithKakaoAccount();
        print('success');
        _getUserInfo();
      } catch (error) {
        print('fail $error');
      }
    }
  }
}

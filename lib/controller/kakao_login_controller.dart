import 'package:copum/api/provider/kakao_login_api_client.dart';
import 'package:copum/api/repository/kakao_login_repository.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_user.dart';

class LoginController extends GetxController {
  final KakaoLoginRepository repository;
  LoginController({required this.repository});

  void checkLogin() async {
    if (await isKakaoTalkInstalled()) {
      try {
        OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
        //print('카카오톡으로 로그인 성공');
        kakaologinControl(token.accessToken);
      } catch (error) {
        //print('카카오톡으로 로그인 실패 $error');

        // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
        // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
        if (error is PlatformException && error.code == 'CANCELED') {
          return;
        }
        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        try {
          OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
          //print('카카오계정으로 로그인 성공');
          kakaologinControl(token.accessToken);
        } catch (error) {
          //print('카카오계정으로 로그인 실패 $error');
        }
      }
    } else {
      try {
        OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
        //print('카카오계정으로 로그인 성공 token: ${token.accessToken}');
        kakaologinControl(token.accessToken);
      } catch (error) {
        //print('카카오계정으로 로그인 실패 $error');
      }
    }
  }

  void kakaologinControl(String accessToken) async {
    final response = await repository.kakaoLogin(accessToken);

    //print(response);
    if (response['error']) {
      // Get.toNamed('/agreement');
      //error ==> ??? Toast?

    } else {
      if (response['status'] == 200) {
        // 메인화면 이동
        Get.toNamed('/home');
      } else {
        // error : false , status 200 이 아닌경우 ,,
      }
    }
  }
}

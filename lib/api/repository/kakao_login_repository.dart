import 'package:copum/api/provider/kakao_login_api_client.dart';
import 'package:meta/meta.dart';

class KakaoLoginRepository {
  final KakaoLoginApiClient apiClient;

  KakaoLoginRepository({required this.apiClient});

  kakaoLogin(String token) {
    return apiClient.kakaoLogin(token);
  }
}

import 'dart:convert';
import 'package:copum/api/model/kakao_login_model.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

const baseUrl = 'http://10.0.2.2:8000/account/kakao/login';

class KakaoLoginApiClient {
  final http.Client httpClient;
  KakaoLoginApiClient({required this.httpClient});

  kakaoLogin(String token) async {
    try {
      final url = Uri.parse('$baseUrl?code=$token');
      print('$url');
      var response = await httpClient.get(url);
      if (response.statusCode == 200) {
        Iterable jsonResponse = json.decode(response.body);
        List<KakaoLoginModel> listMyModel = jsonResponse
            .map((model) => KakaoLoginModel.fromJson(model))
            .toList();
        // listMyModel.removeRange(2, listMyModel.length);
        // List<MyModel> listMyModel = new List<MyModel>.empty();
        return listMyModel;
      } else
        print('erro');
    } catch (e) {
      print('error: ${e.toString()}');
    }
  }
}

import 'dart:convert';
import 'package:copum/api/model/boardmodel.dart';
import 'package:copum/api/provider/kakao_login_api_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:http/http.dart' as http;

class BoardApiClient {
  final http.Client httpClient;
  BoardApiClient({required this.httpClient});

  fetchData() async {
    try {
      http.Response response = await http.get(Uri.parse(boardUrl));
      List<dynamic> body = json.decode(response.body);
      var boardModel =
          body.map((dynamic item) => BoardModel.fromJson(item)).toList();
      return boardModel;
    } catch (e) {
      return null;
    }
  }
}

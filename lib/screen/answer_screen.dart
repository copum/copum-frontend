import 'package:copum/api/model/boardmodel.dart';
import 'package:copum/api/provider/boardapi.dart';
import 'package:copum/api/provider/kakao_login_api_client.dart';
import 'package:copum/controller/board_controller.dart';
import 'package:copum/controller/root_page_controller.dart';
import 'package:copum/screen/tmp.dart';
import 'package:copum/src/question.dart';
import 'package:copum/widget/post_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../src/Search.dart';
import '../src/board_page.dart';
import '../src/profile.dart';
import 'package:get/get.dart';

class AnswerScreen extends GetView<BoardController> {
  @override
  var boardModel = [].obs;

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            '답변',
            style: TextStyle(fontFamily: 'Elice', fontSize: 24),
          ),
        ),
        body: SizedBox(
          height: 500,
          child: ListView.builder(
            itemBuilder: (context, index) => Obx(() {
              var item = boardModel[index];

              return Text(item);
            }),
          ),
        ));
  }
}

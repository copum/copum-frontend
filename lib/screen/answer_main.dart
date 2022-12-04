import 'dart:convert';

import 'package:copum/api/model/boardmodel.dart';
import 'package:copum/api/provider/boardapi.dart';
import 'package:copum/api/provider/kakao_login_api_client.dart';
import 'package:copum/controller/answer_controller.dart';
import 'package:copum/controller/board_controller.dart';
import 'package:copum/controller/root_page_controller.dart';
import 'package:copum/screen/tmp.dart';
import 'package:copum/src/question.dart';
import 'package:copum/widget/post_widget.dart';
// import 'package:copum/widget/test.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../src/Search.dart';
import '../src/board_page.dart';
import '../src/profile.dart';
import 'package:get/get.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;

import '../widget/answer_widget.dart';
import '../widget/test.dart';
// import '../widget/answer_widget.dart';

class AnswerMain extends GetView<AnswerController> {
  QuillController _controller = QuillController.basic();

  @override
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 45,
            ),
            AnswerWidget(),
            const SizedBox(
              height: 20,
            ),
            GetX<AnswerController>(
              initState: (state) {
                Get.find<AnswerController>().fetchBoard();
              },
              builder: (_) {
                return SizedBox(
                  height: 500,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      try {
                        dynamic answer = _.answerModel[index].content;
                        var myJson = jsonDecode(answer);
                        _controller = QuillController(
                            document: Document.fromJson(myJson),
                            selection: TextSelection.collapsed(offset: 0));
                        var result = _controller.document.toPlainText();
                        _.answerModel.value[index].content = result;
                      } catch (e) {
                        print(e);
                      }
                      // return Container();
                      return Get.arguments['pk'] ==
                              _.answerModel.value[index].question_id
                          ? TestWidget(
                              _.answerModel.value[index].title,
                              _.answerModel.value[index].content,
                            )
                          : Container();
                    },
                    separatorBuilder: (context, index) => const Divider(
                      height: 10,
                      color: Colors.white,
                    ),
                    itemCount: _.answerModel.value.length,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

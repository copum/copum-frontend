import 'dart:convert';
import 'package:copum/api/model/boardmodel.dart';
import 'package:copum/api/provider/boardapi.dart';
import 'package:copum/api/provider/kakao_login_api_client.dart';
import 'package:copum/controller/answer_controller.dart';
import 'package:copum/controller/board_controller.dart';
import 'package:copum/controller/root_page_controller.dart';
import 'package:copum/src/question.dart';
import 'package:copum/widget/post_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../src/Search.dart';
import '../src/board_page.dart';
import '../src/profile.dart';
import 'package:get/get.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import '../widget/answer_widget.dart';
import '../widget/aaa.dart';

class AnswerMain extends GetView<AnswerController> {
  QuillController _controller = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    int test = Get.arguments['pk'];
    // final med = MediaQuery.of(context).size;
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
            AnswerWidget(
              pk: Get.arguments['pk'],
              title: Get.arguments['title'],
              content: Get.arguments['content'],
            ),
            GetX<AnswerController>(
              initState: (state) {
                Get.find<AnswerController>().fetchBoard();
              },
              builder: (_) {
                // return SingleChildScrollView(
                //   child: SizedBox(
                //     height: MediaQuery.of(context).size.height,
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    try {
                      dynamic answer = _.answerModel[index].content;
                      var myJson = jsonDecode(answer);
                      _controller = QuillController(
                          document: Document.fromJson(myJson),
                          selection: const TextSelection.collapsed(offset: 0));
                      var result = _controller.document.toPlainText();
                      _.answerModel.value[index].content = result;
                    } catch (e) {
                      print(e);
                    }
                    return test == _.answerModel.value[index].question_id
                        ? TestWidget(
                            _.answerModel.value[index].title,
                            _.answerModel.value[index].content,
                          )
                        : const SizedBox();
                  },
                  itemCount: _.answerModel.value.length,
                  // ),
                  // ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

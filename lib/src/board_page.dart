import 'dart:convert';
import 'package:copum/api/model/boardmodel.dart';
import 'package:copum/controller/board_controller.dart';
import 'package:copum/controller/kakao_login_controller.dart';
import 'package:copum/controller/root_page_controller.dart';
import 'package:copum/widget/post_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:get/route_manager.dart';
import 'package:get/get.dart';
import 'package:copum/widget/category_menu.dart';

class BoardPage extends GetView<BoardController> {
  // late String content;

  // BoardPage() {
  //   Get.find<BoardController>().fetchBoard();
  // }

  QuillController _controller = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: const Text(
          '코품',
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          CategoryMenu(),
          const SizedBox(
            height: 20,
          ),
          GetX<BoardController>(
            initState: (state) {
              Get.find<BoardController>().fetchBoard();
            },
            builder: (_) {
              return _.boardModel.length < 1
                  ? CircularProgressIndicator()
                  : SizedBox(
                      height: 580,
                      child: Obx(
                        () => ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            try {
                              dynamic A = _.boardModel[index].content;
                              var myJSON = jsonDecode(A);
                              _controller = QuillController(
                                  document: Document.fromJson(myJSON),
                                  selection:
                                      TextSelection.collapsed(offset: 0));
                              var a = _controller.document.toPlainText();
                              // print('values: $myJSON');
                              // print('$a');
                              _.boardModel.value[index].content = a;
                            } catch (e) {
                              print(e);
                            }
                            // dynamic _controller = QuillController(
                            // document: Document.fromJson(myJSON),``
                            // selection: TextSelection.collapsed(offset: 0));
                            return SingleChildScrollView(
                              child: PostWidget(
                                _.boardModel.value[index].pk,
                                _.boardModel.value[index].Author["user_id"],
                                _.boardModel.value[index]
                                    .Author["profile_image"],
                                _.boardModel.value[index].title,
                                _.boardModel.value[index].content,
                                _.boardModel.value[index].questionCounting,
                                _.boardModel.value[index].question_created_at,
                                _.boardModel.value[index].answerCounting,
                                _.boardModel.value[index].image,
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const Divider(
                            height: 40,
                            color: Colors.grey,
                          ),
                          itemCount: _.boardModel.value.length,
                        ),
                      ));
            },
          ),
        ],
      ),
    );
  }
}

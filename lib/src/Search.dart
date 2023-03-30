import 'dart:developer';
import 'package:copum/api/model/boardmodel.dart';
import 'package:copum/widget/aaa.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:copum/controller/board_controller.dart';
import 'package:copum/widget/post_widget.dart';
import 'package:flutter/rendering.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;

class SearchScreen extends GetView<BoardController> {
  QuillController _controller = QuillController.basic();
  TextEditingController textController = TextEditingController();

  void onInit() {
    Get.find<BoardController>().clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          '검색',
          style: TextStyle(
            fontFamily: 'Elice',
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: textController,
              onSubmitted: (data) {
                data.isEmpty
                    ? Get.dialog(Title(color: Colors.red, child: Text('dd')))
                    :
                    // print("onSubmit");
                    Get.find<BoardController>().search(data);

                Get.find<BoardController>().clear();
              },
              decoration: InputDecoration(
                  // suffixIcon: Icon(Icons.cancel),
                  suffixIcon: IconButton(
                    onPressed: () {
                      // textController.clear();
                      WidgetsBinding.instance
                          .addPostFrameCallback((_) => textController.clear());
                    },
                    icon: const Icon(Icons.cancel),
                  ),
                  hintText: '제목/내용',
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(width: 0))),
            ),
            const SizedBox(
              height: 10,
            ),
            GetX<BoardController>(
              builder: (_) {
                return _.searchModel.isEmpty
                    ? const SizedBox()
                    : SizedBox(
                        height: 580,
                        child: Obx(
                          () => ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              try {
                                dynamic A = _.searchModel[index].content;
                                print('aaa2');
                                var myJSON = jsonDecode(A);
                                print('bbb: $myJSON');
                                _controller = QuillController(
                                    document: Document.fromJson(myJSON),
                                    selection:
                                        TextSelection.collapsed(offset: 0));
                                var a = _controller.document.toPlainText();
                                // print('values: $myJSON');
                                // print('$a');
                                _.boardModel.value[index].content = a;
                                // return _.boardModel[index].content;
                              } catch (e) {
                                print(e);
                              }
                              // dynamic _controller = QuillController(
                              // document: Document.fromJson(myJSON),``
                              // selection: TextSelection.collapsed(offset: 0));
                              return SingleChildScrollView(
                                child: PostWidget(
                                  _.searchModel.value[index].pk,
                                  _.searchModel.value[index].Author["user_id"],
                                  _.boardModel.value[index]
                                      .Author["profile_image"],
                                  _.searchModel.value[index].title,
                                  _.searchModel.value[index].content,
                                  _.searchModel.value[index].questionCounting,
                                  _.boardModel.value[index].question_created_at,
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => const Divider(
                              height: 40,
                              color: Colors.grey,
                            ),
                            itemCount: _.searchModel.value.length,
                          ),
                        ));
              },
            )
          ],
        ),
      ),
    );
  }
}

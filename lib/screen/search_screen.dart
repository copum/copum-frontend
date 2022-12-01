import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:copum/controller/board_controller.dart';
import 'package:copum/widget/post_widget.dart';
import 'package:flutter/rendering.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;

class SearchScreen extends GetView<BoardController>{
  QuillController _controller = QuillController.basic();
  // String search = '';
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
          onPressed: () {
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [],
      ),
      body:
         Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                TextField(
                  onSubmitted: (data){

                  },
                  decoration: InputDecoration(
                      // suffixIcon: Icon(Icons.cancel),
                      suffixIcon: IconButton(
                        onPressed: () {
                          print("remove");
                          // search = '';
                        },
                        icon: const Icon(Icons.cancel),
                      ),
                      hintText: '제목/내용',
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(width: 0))),
                ),
                SizedBox(height: 10,),
                GetX<BoardController>(
                  initState: (state) {
                    Get.find<BoardController>().fetchBoard();
                  },
                  builder: (_) {
                    return _.boardModel.isEmpty
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
                                  _.boardModel.value[index].title,
                                  _.boardModel.value[index].content,
                                  _.boardModel.value[index].answerCounting,
                                  _.boardModel.value[index].questionCounting,
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
            ),);
  }
}

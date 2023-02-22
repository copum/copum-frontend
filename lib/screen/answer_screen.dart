import 'dart:convert';
import 'dart:io';
import 'package:copum/controller/answer_controller.dart';
import 'package:copum/controller/kakao_login_controller.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:get/get.dart' hide MultipartFile, FormData;

class AnswerScreen extends GetView<AnswerController> {
  String title = '';
  MultipartFile? img;
  late int author;

  Future<void> onPress() async {
    var userModel = Get.find<LoginController>().userModel;
    author = userModel.user_id;

    var str = jsonEncode(_controller.document.toDelta().toJson());

    var controller = Get.find<AnswerController>();
    controller.insert(title, str, author, img, Get.arguments['pk']);
  }

  FocusNode editorFocus = FocusNode();
  bool editorFocused = false;

  QuillController _controller = QuillController.basic();
  final _multiSelectKey = GlobalKey<FormFieldState>();

  Future<String> _onImagePickCallback(File file) async {
    // Copies the picked file from temporary cache to applications directory
    final appDocDir = await getApplicationDocumentsDirectory();
    final copiedFile =
        await file.copy('${appDocDir.path}/${basename(file.path)}');

    img = MultipartFile.fromFileSync(file.path,
        contentType: new MediaType("image", "jpg"));
    return copiedFile.path.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('답변하기'),
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        actions: [
          IconButton(
            icon: new Icon(Icons.send),
            tooltip: 'send',
            onPressed: () {
              onPress();
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Padding(
                //   padding: EdgeInsets.only(left: 20),
                //   child: Row(
                //     children: [
                //       AnswerWidget().profileImage(),
                //       SizedBox(
                //         width: 4,
                //       ),
                //       AnswerWidget().answerBody(),
                //     ],
                //   ),
                // ),
                SizedBox(
                    child: Text("",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 6,
                        ))),
                SizedBox(
                  height: 15,
                ),
                // 제목 + text fielㅇ

                SizedBox(height: 30),

                ///제목

                const Text("제목",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  onChanged: (data) {
                    title = data;
                  },
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      hintText: '제목',
                      hintStyle: TextStyle(color: Colors.white60),
                      filled: true,
                      fillColor: Color.fromARGB(255, 56, 59, 61),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(width: 0))),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 50,
                  child: Text(
                    '내용',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: Color.fromARGB(255, 56, 59, 61),
                        ),
                        constraints: BoxConstraints(
                            minHeight: 100,
                            minWidth: double.infinity,
                            maxHeight: 500),
                        child: QuillEditor(
                          controller: _controller,
                          readOnly: false, // true for view only mode
                          autoFocus: false,
                          scrollController: ScrollController(),
                          expands: true,
                          scrollable: true,
                          padding: EdgeInsets.only(left: 10, right: 10),
                          focusNode: editorFocus!,
                          embedBuilders: FlutterQuillEmbeds.builders(),
                          locale: Locale('ko'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          editorFocused
              ? Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.grey,
                    child: QuillToolbar.basic(
                      controller: _controller,
                      embedButtons: FlutterQuillEmbeds.buttons(
                        onImagePickCallback: _onImagePickCallback,
                      ),
                      locale: Locale('ko'),
                    ),
                  ))
              : SizedBox(height: 0)
        ]),
      ),
    );
  }
}

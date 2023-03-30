import 'dart:convert';
import 'dart:io';
import 'package:copum/controller/board_controller.dart';
import 'package:copum/src/profile.dart';
import 'package:copum/widget/answer_widget.dart';
import 'package:dio/dio.dart';
// import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart'; // category
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:get/get.dart' hide MultipartFile, FormData;

import '../controller/kakao_login_controller.dart';

class Category {
  final int id;
  final String name;

  const Category({required this.id, required this.name});

  static fromJson(json) {}
}

class QuestionScreen extends GetView<BoardController> {
  String title = '';
  MultipartFile? img;
  late int author_id;

  Future<void> onPress() async {
    var str = jsonEncode(_controller.document.toDelta().toJson());
    var dio = Dio();

    var controller = Get.find<BoardController>();
    controller.insert(
        title,
        str,
        author_id,
        _selectedCategory[0]!.id,
        _selectedCategory.length >= 2 ? _selectedCategory[1]!.id : null,
        _selectedCategory.length >= 3 ? _selectedCategory[2]!.id : null,
        _selectedCategory.length >= 4 ? _selectedCategory[3]!.id : null);
    _controller.clear();
    Get.toNamed('home');
  }

  FocusNode editorFocus = FocusNode();
  bool editorFocused = false;

  @override
  QuillController _controller = QuillController.basic();
  static final List<Category> _categories = [
    const Category(id: 1, name: 'Dart'),
    const Category(id: 2, name: 'Php'),
    const Category(id: 3, name: 'Python'),
    const Category(id: 4, name: 'Java'),
    const Category(id: 5, name: 'Go'),
    const Category(id: 6, name: 'MySQL'),
    const Category(id: 7, name: 'JavaScript'),
  ];

  final _items = _categories
      .map((category1) => MultiSelectItem<Category?>(category1, category1.name))
      .toList();
  List<Category?> _selectedCategory = [];
  MultiSelectChipDisplay<Category> chip = MultiSelectChipDisplay<Category>(
    textStyle:
        TextStyle(color: Colors.yellow, backgroundColor: Colors.red), // 칩 글자 색
    chipColor: Color.fromARGB(255, 56, 59, 61),
  );
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
    var userModel = Get.find<LoginController>().userModel;
    author_id = userModel.user_id;

    // Get.put(QuestionTestController());
    // Get.find<QuestionTestController>().onInit();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('질문하기'),
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              //Get.to(Login());
            },
            icon: const Icon(Icons.arrow_back)),
        actions: [
          new IconButton(
            icon: new Icon(Icons.send),
            tooltip: 'send',
            onPressed: () {
              onPress();
              // setState(() {});
            },
          )
        ],
      ),
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // AnswerWidget(
                  //   pk: 3,
                  // ).profileImage(),
                  // Text("Get.arguments[title]"),
                ],
              ),
              Text("Get.arguments[title]"),
              const SizedBox(
                height: 15,
              ),
              // 제목 + text fielㅇ
              MultiSelectDialogField(
                validator: (data) {
                  print("validator ${data}");
                },
                items: _items,
                title: const Text("Category"),
                initialValue: [],
                selectedColor: Colors.orange,
                chipDisplay: chip,
                decoration: BoxDecoration(
                  // color: Colors.blue.withOpacity(0.1),
                  color: const Color.fromARGB(255, 56, 59, 61),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  border: Border.all(
                    width: 2,
                  ),
                ),
                buttonIcon: const Icon(
                  Icons.add,
                  color: Colors.orange,
                ),
                buttonText: const Text(
                  "Select Category",
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 16,
                  ),
                ),
                onSelectionChanged: (test) {
                  print("change");
                  print(test);
                },
                onConfirm: (results) {
                  _selectedCategory = results.cast<Category?>();
                  // if(results.length > 4){
                  //   print("error");
                  //   results = [];
                  //   _selectedCategory = [];
                  // }else {
                  //   _selectedCategory = results.cast<Category?>();
                  // }
                  // print("selected category");
                  // print(_selectedCategory);
                },
              ),
              const SizedBox(height: 30),

              ///제목

              const Text("제목",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              const SizedBox(
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

              Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: Color.fromARGB(255, 56, 59, 61),
                      ),
                      constraints: const BoxConstraints(
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
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        focusNode: editorFocus!,
                        embedBuilders: FlutterQuillEmbeds.builders(),
                        locale: const Locale('ko'),
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
            : const SizedBox(height: 0)
      ]),
    );
  }
}

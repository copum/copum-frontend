import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
// import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart'; // category
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _BoardScreen();
}

class Category {
  final int id;
  final String name;

  const Category({required this.id, required this.name});
}

class _BoardScreen extends State<QuestionScreen> {
  String title = '';
  MultipartFile? img;
  Future<void> onPress() async {
    var url = "http://localhost:8000/question/";
    String str = _controller.document.toDelta().toJson().toString();
    var dio = Dio();

    dio.options.contentType = 'multipart/form-data';
    var formData = new FormData.fromMap({
      'Question_category1': _selectedCategory[0]!.id,
      'Question_category2':
          _selectedCategory.length >= 2 ? _selectedCategory[1]!.id : null,
      'Question_category3':
          _selectedCategory.length >= 3 ? _selectedCategory[2]!.id : null,
      'Question_category4':
          _selectedCategory.length >= 4 ? _selectedCategory[3]!.id : null,
      'Question_title': title,
      'Question_image': img ?? null,
      'Question_content': str,
    });
    try {
      var response = await dio.post(url, data: formData);
      print(response.data.toString());
      print("success");
    } catch (e) {
      print(e.toString());
      print("error");
    }
  }

  FocusNode? editorFocus;
  bool editorFocused = false;

  void initState() {
    super.initState();
    editorFocus = FocusNode();
    _editorFocusListener();
  }

  _editorFocusListener() {
    editorFocus!.addListener(() {
      setState(() {
        editorFocused = editorFocus!.hasFocus ? true : false;
      });
    });
  }

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
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
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
              setState(() {});
            },
          )
        ],
      ),
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              // 제목 + text fielㅇ
              MultiSelectDialogField(
                validator: (data) {
                  print("validator ${data}");
                },
                items: _items,
                title: Text("Category"),
                initialValue: [],
                selectedColor: Colors.orange,
                chipDisplay: chip,
                decoration: BoxDecoration(
                  // color: Colors.blue.withOpacity(0.1),
                  color: Color.fromARGB(255, 56, 59, 61),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  border: Border.all(
                    width: 2,
                  ),
                ),
                buttonIcon: Icon(
                  Icons.add,
                  color: Colors.orange,
                ),
                buttonText: Text(
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
              SizedBox(
                height: 10,
              ),

              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
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
    );
  }
}

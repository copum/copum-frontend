// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_quill/flutter_quill.dart' hide Text;
// import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';
// import 'package:multi_select_flutter/multi_select_flutter.dart'; // category
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart';
// class BoardScreen extends StatefulWidget {
//   const BoardScreen({Key? key}) : super(key: key);

//   @override
//   State<BoardScreen> createState() => _BoardScreen();
// }

// class Category {
//   final int id;
//   final String name;

//   const Category({required this.id, required this.name});
// }

// class _BoardScreen extends State<BoardScreen> {
//   QuillController _controller = QuillController.basic();
//   bool focus = false;
//   String title = '';
//   static final List<Category> _categories = [
//     const Category(id: 1, name: '프로그래밍 기초'),
//     const Category(id: 2, name: 'PHP'),
//     const Category(id: 3, name: 'JSP'),
//     const Category(id: 4, name: 'PYTHON'),
//     const Category(id: 5, name: 'GO'),
//     const Category(id: 6, name: 'SQL'),
//     const Category(id: 7, name: 'JAVASCRIPT'),
//     const Category(id: 8, name: 'DART'),
//     const Category(id: 9, name: 'R'),
//     const Category(id: 10, name: 'R'),
//     const Category(id: 11, name: '프로그래밍 기초'),
//     const Category(id: 12, name: 'PHP'),
//     const Category(id: 13, name: 'JSP'),
//     const Category(id: 14, name: 'PYTHON'),
//     const Category(id: 15, name: 'GO'),
//     const Category(id: 16, name: 'SQL'),
//     const Category(id: 17, name: 'JAVASCRIPT'),
//     const Category(id: 18, name: 'DART'),
//     const Category(id: 19, name: 'R'),
//   ];

//   final _items = _categories
//       .map((category1) => MultiSelectItem<Category?>(category1, category1.name))
//       .toList();
//   List<Object?> _selectedCategory = [];
//   List<Object?> _selectedCategory2 = [];
//   MultiSelectChipDisplay<Category> chip = MultiSelectChipDisplay<Category>(
//     textStyle:
//     TextStyle(color: Colors.yellow, backgroundColor: Colors.red), // 칩 글자 색
//     chipColor: Color.fromARGB(255, 56, 59, 61),
//   );
//   void createPost(
//       title,
//       body,
//       ) async {
//     var url = Uri.parse(
//       'http://localhost:8080/post',
//     );
//     var result = await http.post(url, body: {title: title, body: body});
//   }

//   final _multiSelectKey = GlobalKey<FormFieldState>();

//   Future<String> _onImagePickCallback(File file) async {
//     // Copies the picked file from temporary cache to applications directory
//     final appDocDir = await getApplicationDocumentsDirectory();
//     final copiedFile =
//     await file.copy('${appDocDir.path}/${basename(file.path)}');
//     return copiedFile.path.toString();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.black,
//         appBar: AppBar(
//           title: const Text('질문하기'),
//           backgroundColor: Colors.black,
//           centerTitle: true,
//           leading: IconButton(
//               onPressed: () {
//                 //Get.to(Login());
//               },
//               icon: const Icon(Icons.arrow_back)),
//           actions: [
//             new IconButton(
//               icon: new Icon(Icons.send),
//               tooltip: 'send',
//               onPressed: (){},
//             )
//           ],
//         ),
//         body: Container(
//           padding: EdgeInsets.all(20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 15,
//               ),
//               // 제목 + text fielㅇ
//               MultiSelectDialogField(
//                 validator: (data){
//                   print("validator ${data}");
//                 },
//                 items: _items,
//                 title: Text("Category"),
//                 initialValue: [..._selectedCategory],
//                 selectedColor: Colors.orange,
//                 chipDisplay: chip,
//                 decoration: BoxDecoration(
//                   // color: Colors.blue.withOpacity(0.1),
//                   color: Color.fromARGB(255, 56, 59, 61),
//                   borderRadius: BorderRadius.all(Radius.circular(8)),
//                   border: Border.all(
//                     width: 2,
//                   ),
//                 ),
//                 buttonIcon: Icon(
//                   Icons.add,
//                   color: Colors.orange,
//                 ),
//                 buttonText: Text(
//                   "Select Category",
//                   style: TextStyle(
//                     color: Colors.white60,
//                     fontSize: 16,
//                   ),
//                 ),
//                 onSelectionChanged: (test){
//                   print("change");
//                   print(test);
//                 },
//                 onConfirm: (results) {
//                   if(results.length > 4){
//                     print("error");
//                     results = [];
//                     _selectedCategory = [];
//                   }else {
//                     _selectedCategory = results;
//                   }
//                   print("selected category");
//                   print(_selectedCategory);
//                 },
//               ),
//               SizedBox(height: 30),
//               ///제목
//               Container(
//                 margin: EdgeInsets.only(bottom: 20),
//                 child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text("제목",
//                           style: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold)),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       TextField(
//                         style : const TextStyle(color: Colors.white),
//                         decoration: const InputDecoration(
//                             hintText: '제목',
//                             hintStyle: TextStyle(color: Colors.white60),
//                             filled: true,
//                             fillColor: Color.fromARGB(255, 56, 59, 61),
//                             border: OutlineInputBorder(
//                               borderRadius:
//                               BorderRadius.all(Radius.circular(8)),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                                 borderRadius:
//                                 BorderRadius.all(Radius.circular(8)),
//                                 borderSide: BorderSide(width: 0))),
//                       )
//                     ]),
//               ),
//               // Expanded(
//               //   child: Container(
//               //     padding: EdgeInsets.all(10),
//               //     decoration: BoxDecoration(
//               //       borderRadius: BorderRadius.all(Radius.circular(8)),
//               //       color: Color.fromARGB(255, 56, 59, 61),
//               //     ),
//               //     child: QuillEditor(
//               //       controller: _controller,
//               //       readOnly: false, // true for view only mode
//               //       autoFocus: false,
//               //       scrollController: ScrollController(),
//               //       expands: true,
//               //       scrollable: true,
//               //       padding: EdgeInsets.only(left: 10, right: 10),
//               //       focusNode: FocusNode(),
//               //       embedBuilders: FlutterQuillEmbeds.builders(),
//               //       locale: Locale('ko'),
//               //     ),
//               //   ),
//               // ),
//               Container(
//                 color: Colors.grey,
//                 margin: EdgeInsets.only(top: 20),
//                 child: QuillToolbar.basic(
//                   controller: _controller,
//                   embedButtons: FlutterQuillEmbeds.buttons(
//                     onImagePickCallback: _onImagePickCallback,
//                   ),
//                   locale: Locale('ko'),
//                 ),
//               )
//             ],
//           ),
//         )
//     );
//   }
// }

// /*
// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_quill/flutter_quill.dart' hide Text;
// import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';
// import 'package:multi_select_flutter/multi_select_flutter.dart'; // category
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart';
// class BoardScreen extends StatefulWidget {
//   const BoardScreen({Key? key}) : super(key: key);

//   @override
//   State<BoardScreen> createState() => _BoardScreen();
// }

// class Category {
//   final int id;
//   final String name;

//   const Category({required this.id, required this.name});
// }

// class _BoardScreen extends State<BoardScreen> {
//   FocusNode? editorFocus;
//   bool editorFocused = false;
//   void initState(){
//     super.initState();
//     editorFocus = FocusNode();
//     _editorFocusListener();
//   }
//   _editorFocusListener(){
//     editorFocus!.addListener(() {
//       setState(() {
//         editorFocused = editorFocus!.hasFocus ? true : false;
//       });
//     });
//   }



//   QuillController _controller = QuillController.basic();
//   String title = '';
//   static final List<Category> _categories = [
//     const Category(id: 1, name: '프로그래밍 기초'),
//     const Category(id: 2, name: 'PHP'),
//     const Category(id: 3, name: 'JSP'),
//     const Category(id: 4, name: 'PYTHON'),
//     const Category(id: 5, name: 'GO'),
//     const Category(id: 6, name: 'SQL'),
//     const Category(id: 7, name: 'JAVASCRIPT'),
//     const Category(id: 8, name: 'DART'),
//     const Category(id: 9, name: 'R'),
//     const Category(id: 10, name: 'R'),
//     const Category(id: 11, name: '프로그래밍 기초'),
//     const Category(id: 12, name: 'PHP'),
//     const Category(id: 13, name: 'JSP'),
//     const Category(id: 14, name: 'PYTHON'),
//     const Category(id: 15, name: 'GO'),
//     const Category(id: 16, name: 'SQL'),
//     const Category(id: 17, name: 'JAVASCRIPT'),
//     const Category(id: 18, name: 'DART'),
//     const Category(id: 19, name: 'R'),
//   ];

//   final _items = _categories
//       .map((category1) => MultiSelectItem<Category?>(category1, category1.name))
//       .toList();
//   List<Object?> _selectedCategory = [];
//   List<Object?> _selectedCategory2 = [];
//   MultiSelectChipDisplay<Category> chip = MultiSelectChipDisplay<Category>(
//     textStyle:
//         TextStyle(color: Colors.yellow, backgroundColor: Colors.red), // 칩 글자 색
//     chipColor: Color.fromARGB(255, 56, 59, 61),
//   );
//   void createPost(
//     title,
//     body,
//   ) async {
//     var url = Uri.parse(
//       'http://localhost:8080/post',
//     );
//     var result = await http.post(url, body: {title: title, body: body});
//   }

//   final _multiSelectKey = GlobalKey<FormFieldState>();

//   Future<String> _onImagePickCallback(File file) async {
//     // Copies the picked file from temporary cache to applications directory
//     final appDocDir = await getApplicationDocumentsDirectory();
//     final copiedFile =
//     await file.copy('${appDocDir.path}/${basename(file.path)}');
//     return copiedFile.path.toString();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//         appBar: AppBar(
//           title: const Text('질문하기'),
//           backgroundColor: Colors.black,
//           centerTitle: true,
//           leading: IconButton(
//               onPressed: () {
//                 //Get.to(Login());
//               },
//               icon: const Icon(Icons.arrow_back)),
//           actions: [
//             new IconButton(
//               icon: new Icon(Icons.send),
//               tooltip: 'send',
//               onPressed: (){},
//             )
//           ],
//         ),
//         body:SingleChildScrollView(
//           child:
//               Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 15,
//               ),
//               // 제목 + text fielㅇ
//               MultiSelectDialogField(
//                 validator: (data){
//                   print("validator ${data}");
//                 },
//                 items: _items,
//                 title: Text("Category"),
//                 initialValue: [..._selectedCategory],
//                 selectedColor: Colors.orange,
//                 chipDisplay: chip,
//                 decoration: BoxDecoration(
//                   // color: Colors.blue.withOpacity(0.1),
//                   color: Color.fromARGB(255, 56, 59, 61),
//                   borderRadius: BorderRadius.all(Radius.circular(8)),
//                   border: Border.all(
//                     width: 2,
//                   ),
//                 ),
//                 buttonIcon: Icon(
//                   Icons.add,
//                   color: Colors.orange,
//                 ),
//                 buttonText: Text(
//                   "Select Category",
//                   style: TextStyle(
//                     color: Colors.white60,
//                     fontSize: 16,
//                   ),
//                 ),
//                 onSelectionChanged: (test){
//                   print("change");
//                   print(test);
//                 },
//                 onConfirm: (results) {
//                   if(results.length > 4){
//                     print("error");
//                     results = [];
//                       _selectedCategory = [];
//                   }else {
//                     _selectedCategory = results;
//                   }
//                   print("selected category");
//                   print(_selectedCategory);
//                 },
//               ),
//               SizedBox(height: 30),
//               ///제목

//               const Text("제목",
//                   style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold)),
//               SizedBox(
//                 height: 10,
//               ),
//               TextField(
//                 style : const TextStyle(color: Colors.white),
//                 decoration: const InputDecoration(
//                     hintText: '제목',
//                     hintStyle: TextStyle(color: Colors.white60),
//                     filled: true,
//                     fillColor: Color.fromARGB(255, 56, 59, 61),
//                     border: OutlineInputBorder(
//                       borderRadius:
//                           BorderRadius.all(Radius.circular(8)),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                         borderRadius:
//                             BorderRadius.all(Radius.circular(8)),
//                         borderSide: BorderSide(width: 0))),
//               ),
//               SizedBox(height:10,),

//               Center(
//                 child: Column(
//                   children: [
//                     SizedBox(height:10,),
//                     Container(
//                       padding: EdgeInsets.all(15),
//                         decoration: const BoxDecoration(
//                           borderRadius: BorderRadius.all(Radius.circular(8)),
//                           color: Color.fromARGB(255, 56, 59, 61),
//                         ),
//                       constraints: BoxConstraints(minHeight: 100, minWidth: double.infinity, maxHeight: 500),
//                       child: QuillEditor(
//                         controller: _controller,
//                         readOnly: false, // true for view only mode
//                         autoFocus: false,
//                         scrollController: ScrollController(),
//                         expands: true,
//                         scrollable: true,
//                         padding: EdgeInsets.only(left: 10, right: 10),
//                         focusNode: editorFocus!,
//                         embedBuilders: FlutterQuillEmbeds.builders(),
//                         locale: Locale('ko'),
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//     );
//   }
// }

// * */
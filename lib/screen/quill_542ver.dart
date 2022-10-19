// import 'dart:convert';
// import 'dart:io';
//
// import 'package:file_picker/file_picker.dart';
// import 'package:filesystem_picker/filesystem_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_quill/flutter_quill.dart' hide Text;
// import 'package:http/http.dart' as http;
// import 'package:multi_select_flutter/multi_select_flutter.dart'; // category
// import 'package:path_provider/path_provider.dart'; // getApplicationDocumentsDirectory
// import 'package:path/path.dart'; // basename
//
// class Quill_542ver extends StatefulWidget {
//   const Quill_542ver({Key? key}) : super(key: key);
//
//   @override
//   State<Quill_542ver> createState() => _Quill_542ver();
// }
//
// class Category {
//   final int id;
//   final String name;
//
//   const Category({required this.id, required this.name});
// }
//
// class _Quill_542ver extends State<Quill_542ver> {
//   bool _showEditor = false;
//   QuillController _controller = QuillController.basic();
//
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
//
//   final _items = _categories
//       .map((category1) => MultiSelectItem<Category?>(category1, category1.name))
//       .toList();
//   List<Category?> _selectedCategory = [];
//   List<Category?> _selectedCategory2 = [];
//   MultiSelectChipDisplay<Category> chip = MultiSelectChipDisplay<Category>(
//     textStyle:
//     TextStyle(color: Colors.yellow, backgroundColor: Colors.red), // 칩 글자 색
//     chipColor: Color.fromARGB(255, 56, 59, 61),
//     // decoration: BoxDecoration(
//     //     borderRadius: BorderRadius.circular(8), color: Colors.green),
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
//
//   final _multiSelectKey = GlobalKey<FormFieldState>();
//
//   void createPost2() async {
//     // print(_controller.document.toDelta().toJson());
//     // print(this.title);
//     var body = _controller.document.toDelta().toString();
//     print(body);
//     // var url = Uri.parse(
//     //   'http://localhost:8080/post',
//     // );
//     // var result = await http.post(url, body: {
//     //   title: title,
//     //   body: body,
//     //   categories: ["test1", "test2"]
//     // });
//   }
//   Future<String> _onImagePickCallback(File file) async {
//     // Copies the picked file from temporary cache to applications directory
//     final appDocDir = await getApplicationDocumentsDirectory();
//     final copiedFile =
//     await file.copy('${appDocDir.path}/${basename(file.path)}');
//     return copiedFile.path.toString();
//   }
//   @override
//   Widget build(BuildContext context) {
//
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
//               onPressed: () => {createPost2()},
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
//               // 제목 + text field
//
//               // Container(
//               //   margin: EdgeInsets.only(bottom: 20),
//               //   child: Column(
//               //     crossAxisAlignment: CrossAxisAlignment.start,
//               //     children: [
//               //       Text("태그",
//               //           style: TextStyle(
//               //               color: Colors.white,
//               //               fontSize: 20,
//               //               fontWeight: FontWeight.bold)),
//               //       SizedBox(
//               //         height: 10,
//               //       ),
//               //       Row(
//               //         children: [
//               //           Container(
//               //             margin: EdgeInsets.only(right: 10),
//               //             decoration: BoxDecoration(
//               //                 borderRadius: BorderRadius.circular(10),
//               //                 color: Color.fromARGB(255, 56, 59, 61)),
//               //             padding: EdgeInsets.all(10),
//               //             child: Text(
//               //               "<프로그래밍기초>",
//               //               style: TextStyle(color: Colors.orange),
//               //             ),
//               //           ),
//               //           Container(
//               //             margin: EdgeInsets.only(right: 10),
//               //             decoration: BoxDecoration(
//               //                 borderRadius: BorderRadius.circular(10),
//               //                 color: Color.fromARGB(255, 56, 59, 61)),
//               //             padding: EdgeInsets.all(10),
//               //             child: Text(
//               //               "<JAVA>",
//               //               style: TextStyle(color: Colors.orange),
//               //             ),
//               //           ),
//               //           Container(
//               //             margin: EdgeInsets.only(right: 10),
//               //             decoration: BoxDecoration(
//               //                 borderRadius: BorderRadius.circular(10),
//               //                 color: Color.fromARGB(255, 56, 59, 61)),
//               //             padding: EdgeInsets.all(10),
//               //             child: Text(
//               //               "+",
//               //               style: TextStyle(color: Colors.orange),
//               //             ),
//               //           ),
//               //         ],
//               //       )
//               //     ],
//               //   ),
//               // ),
//               MultiSelectDialogField(
//                 items: _items,
//                 title: Text("Category"),
//                 selectedColor: Colors.orange,
//                 chipDisplay: chip,
//                 decoration: BoxDecoration(
//                   // color: Colors.blue.withOpacity(0.1),
//                   color: Color.fromARGB(255, 56, 59, 61),
//                   borderRadius: BorderRadius.all(Radius.circular(8)),
//                   border: Border.all(
//                     // color: Colors.blue,
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
//                 onConfirm: (results) {
//                   //_selectedAnimals = results;
//                 },
//               ),
//               SizedBox(height: 30),
//               //////////////////////////////////////////////////////
//
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
//               Expanded(
//                 child: Container(
//                   padding: EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(8)),
//                     color: Color.fromARGB(255, 56, 59, 61),
//                   ),
//                   child: QuillEditor(
//                     controller: _controller,
//                     readOnly: false, // true for view only mode
//                     autoFocus: false,
//                     scrollController: ScrollController(),
//                     expands: true,
//                     scrollable: true,
//                     padding: EdgeInsets.only(left: 10, right: 10),
//                     focusNode: FocusNode(),
//                     locale: Locale('ko'),
//                   ),
//                 ),
//               ),
//               Container(
//                 color: Colors.grey,
//                 margin: const EdgeInsets.only(top: 20),
//                 child: QuillToolbar.basic(
//                   controller: _controller,
//                   locale: const Locale('ko'),
//                   showDirection:true,
//                   showFormulaButton : true,
//                 ),
//               )
//             ],
//           ),
//         ));
//   }
// }

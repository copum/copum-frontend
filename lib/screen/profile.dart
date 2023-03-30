// import 'package:copum/api/provider/user_api.dart';
// import 'package:copum/api/repository/user_repository.dart';
// import 'package:copum/controller/user_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// class ProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text(
//           '내 프로필',
//           style: TextStyle(
//             fontFamily: 'Elice',
//             fontSize: 18,
//           ),
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () {},
//           icon: const Icon(Icons.arrow_back),
//         ),
//         actions: [],
//       ),
//       body: SingleChildScrollView(
//           padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
//           child: Center(
//             child: Column(children: [
//               //프로필 사진 넣는 컨테이너
//               SizedBox(
//                 height: 30,
//               ),
//               Center(
//                   child: Container(
//                       padding: EdgeInsets.all(1),
//                       decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           border: Border.all(color: Colors.lime, width: 1)),
//                       child: FittedBox(
//                         child: ClipRRect(
//                             borderRadius: BorderRadius.circular(300),
//                             child: Image.network(
//                                 'https://picsum.photos/150?image=9')),
//                       ))),
//               SizedBox(
//                 height: 50,
//               ),
//               // CustonRow(dataTitle("사용자 이름"),
//               //     dataContent("${Get.find<UserController>().user.userId}")),
//               // CustonRow(dataTitle("사용자 이름"), dataContent("test")),
//               // CustonRow(dataTitle("레벨"), dataContent("기초")),
//               // CustonRow(dataTitle("관심기술"), dataContent("이것저것")),
//               // CustonRow(dataTitle("소개"), dataContent("이것저것")),
//             ]),
//           )),
//     );
//   }

//   Widget CustonRow(Widget widget1, Widget widget2) {
//     return IntrinsicHeight(
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           widget1,
//           widget2,
//         ],
//       ),
//     );
//   }

//   Widget dataTitle(String title) {
//     return Expanded(
//         child: Container(
//             padding: EdgeInsets.all(20),
//             child: Text(
//               title,
//               style: TextStyle(
//                   color: Colors.grey,
//                   fontSize: 15,
//                   fontWeight: FontWeight.bold),
//             )));
//     // return Column(

//     // )
//   }

//   Widget dataContent(String content) {
//     return Expanded(
//         flex: 2,
//         child: Container(
//             child: Container(
//           padding: EdgeInsets.all(20),
//           child: Text(
//             content,
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 15,
//             ),
//           ),
//         )));
//   }
// }

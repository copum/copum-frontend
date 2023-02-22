import 'dart:convert';

import 'package:copum/api/model/boardmodel.dart';
import 'package:copum/api/provider/boardapi.dart';
import 'package:copum/controller/answer_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_talk.dart';
import 'package:get/get.dart';

import '../controller/board_controller.dart';
import '../controller/kakao_login_controller.dart';

class AnswerWidget extends GetView<BoardController> {
  int? id;
  String title;
  String content;
  int? answerCounting;
  int? questionCounting;

  List Cat = ["Dart", "PHP", "Python", "Java", "Go", "MySQL", "JavaScript"];
  String cat = '';

  late int pk;

  QuillController _controller = QuillController.basic();

  AnswerWidget(
      {required this.pk, required this.title, required this.content, Key? key})
      : super(key: key);

// 프로필 사진
  Widget profileImage() {
    return GestureDetector(
      onTap: () {
        // A = title;
        // Get.toNamed('/answer');
      },
      child: const CircleAvatar(
        radius: 20,
        backgroundColor: Colors.red,
      ),
    );
  }

// 프로필이름 , 시간
  Widget answerBody(String profile) {
    return Column(
      children: [
        Text(
          profile,
          style: const TextStyle(fontSize: 12, color: Colors.white),
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          '시간',
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }

// 포스트 제목 추가
  Widget answerTitle(title) {
    return Text(
      // Get.arguments['title'],
      title,

      style: const TextStyle(fontSize: 16, color: Colors.white),
      // style: TextStyle(fontsize),
    );
  }

// 포스트 내용
  Widget answerContent(content) {
    return Text(
      // Get.arguments['content'],
      content,
      style: const TextStyle(fontSize: 16, color: Colors.white),
      // style: TextStyle(fontsize),
    );
  }

  Widget categoryText(cat) {
    return Text(
      cat,
      style: const TextStyle(fontSize: 16, color: Colors.grey),
    );
  }

  @override
  Widget build(BuildContext context) {
    var userModel = Get.find<LoginController>().userModel;
    return Container(
        margin: const EdgeInsets.only(left: 26, right: 26),
        alignment: Alignment.topLeft,
        child: SizedBox(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // const SizedBox(
                  //   width: 20,
                  // ),
                  profileImage(),
                  const SizedBox(
                    width: 10,
                  ),
                  answerBody(userModel.profile),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
                child: Text(
                  cat,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
              answerTitle(title),
              const SizedBox(
                height: 20,
              ),
              Text(
                // '${Get.arguments['quesitonCounting']} 번의 조회 * ${Get.arguments['answerCounting']} 개의 답변',
                "test",
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Divider(
                height: 2,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 16,
              ),
              answerContent(content),
              const SizedBox(
                height: 24,
              ),
              //이미지
              SizedBox(
                height: 250,
                width: double.infinity,
                child: Container(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey,
                        minimumSize: const Size(152, 44),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        elevation: 0.0,
                      ),
                      icon: const Icon(
                        Icons.question_answer,
                        color: Colors.white,
                      ),
                      label: const Text(
                        '궁금합니다!',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                  const SizedBox(
                    width: 16,
                  ),
                  ElevatedButton.icon(
                      onPressed: () {
                        Get.toNamed('/answer2', arguments: {
                          'pk': pk,
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.greenAccent,
                        minimumSize: const Size(160, 44),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        elevation: 0.0,
                      ),
                      icon: const Icon(
                        Icons.question_answer,
                        color: Colors.black,
                      ),
                      label: const Text(
                        '답변하기',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ))
                ],
              )
            ],
          )
        ])));
  }
}

//     return Container(
//       margin: const EdgeInsets.only(left: 26, right: 26),
//       child: SizedBox(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 // const SizedBox(
//                 //   width: 20,
//                 // ),
//                 profileImage(),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 answerBody(),
//                 // const SizedBox(
//                 //   height: 20,
//                 // ),
//               ],
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             const SizedBox(
//               height: 20,
//               child: Text(
//                 'category',
//                 style: TextStyle(fontSize: 12, color: Colors.grey),
//               ),
//             ),
//             answerTitle(),
//             const SizedBox(
//               height: 20,
//             ),
//             Text(
//               '${Get.arguments['quesitonCounting']} 번의 조회 * ${Get.arguments['answerCounting']} 개의 답변',
//               style: const TextStyle(
//                 color: Colors.grey,
//                 fontSize: 12,
//               ),
//             ),
//             const SizedBox(
//               height: 16,
//             ),
//             const Divider(
//               height: 2,
//               color: Colors.grey,
//             ),
//             const SizedBox(
//               height: 16,
//             ),
//             answerContent(),
//             const SizedBox(
//               height: 24,
//             ),
//             //이미지
//             SizedBox(
//               height: 250,
//               width: double.infinity,
//               child: Container(
//                 color: Colors.white,
//               ),
//             ),

//             const SizedBox(
//               height: 16,
//             ),
//             Row(
//               children: [
//                 ElevatedButton.icon(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.grey,
//                       minimumSize: const Size(152, 44),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12.0),
//                       ),
//                       elevation: 0.0,
//                     ),
//                     icon: const Icon(
//                       Icons.question_answer,
//                       color: Colors.white,
//                     ),
//                     label: const Text(
//                       '궁금합니다!',
//                       style: TextStyle(
//                         color: Colors.white,
//                       ),
//                     )),
//                 const SizedBox(
//                   width: 16,
//                 ),
//                 ElevatedButton.icon(
//                     onPressed: () {
//                       Get.toNamed('/answer2');
//                     },
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.greenAccent,
//                       minimumSize: const Size(160, 44),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12.0),
//                       ),
//                       elevation: 0.0,
//                     ),
//                     icon: const Icon(
//                       Icons.question_answer,
//                       color: Colors.black,
//                     ),
//                     label: const Text(
//                       '답변하기',
//                       style: TextStyle(
//                         color: Colors.black,
//                       ),
//                     ))
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// /* category 1,2,3,4 == null ->
// category1,2,3,4[]

// */

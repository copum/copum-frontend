import 'package:copum/api/model/boardmodel.dart';
import 'package:copum/api/provider/boardapi.dart';
import 'package:copum/controller/answer_controller%20copy.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_talk.dart';
import 'package:get/get.dart';

import '../controller/board_controller.dart';

class TestWidget extends GetView<AnswerController> {
  int? id;
  String title;
  String content;
  String? answer_created_at;

  TestWidget(this.title, this.content, {Key? key}) : super(key: key);

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
  Widget answerBody() {
    return Column(
      children: [
        Text(
          Get.arguments['title'],
          style: const TextStyle(fontSize: 12, color: Colors.white),
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          Get.arguments['title'],
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }

// 포스트 제목 추가
  // Widget answerTitle() {
  //   return Text(
  //     Get.arguments['title'],
  //     style: const TextStyle(fontSize: 16, color: Colors.white),
  //     // style: TextStyle(fontsize),
  //   );
  // }

// 포스트 내용
  Widget answerContent(String content) {
    return Text(
      // 'text_content => 터미널에서 키 해시를 생성하려면 키 해시를 관리하는 키툴(keytool)이 필요합니다. Windows의 경우, Windows 라이브러리를 위한 OpenSSL을 다운로드해야 합니다.',
      '$content',
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget answerTitle(String title) {
    return Text(
      // 'test => 터미널에서 키 해시를 생성하려면 키 해시를 관리하는 키툴(keytool)이 필요합니다. Windows의 경우, Windows 라이브러리를 위한 OpenSSL을 다운로드해야 합니다.',
      '$title',
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: Colors.black87,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 26, right: 26),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            profileImage(),
            Container(
              padding: const EdgeInsets.only(left: 16, right: 16),
              color: Colors.white70,
              height: 440,
              width: 280,
              margin: const EdgeInsets.only(right: 60),
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      profileImage(),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        '답변자 닉네임',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  answerTitle(title),
                  const SizedBox(
                    height: 16,
                  ),
                  answerContent(content),
                  const SizedBox(
                    height: 8,
                  ),
                  // 답변 이미지
                  Container(
                    color: Colors.white,
                    height: 140,
                    width: 250,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* category 1,2,3,4 == null -> 
category1,2,3,4[]


*/

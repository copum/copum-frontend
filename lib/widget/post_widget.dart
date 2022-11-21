import 'package:copum/api/model/boardmodel.dart';
import 'package:copum/api/provider/boardapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_talk.dart';
import 'package:get/get.dart';

import '../controller/board_controller.dart';

class PostWidget extends GetView<BoardController> {
  int? id;
  String title;
  String content;
  int answerCounting;
  int questionCounting;

  PostWidget(
      this.title, this.content, this.answerCounting, this.questionCounting,
      {Key? key})
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
  Widget body() {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 12, color: Colors.white),
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
// 포스트 제목 추가

// 포스트 내용
  Widget postContent() {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/answer', arguments: {
          'title': title,
          'content': content,
          'answerCounting': answerCounting,
          'questionCounting': questionCounting
        });
      },
      child: Text(
        content,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 16, color: Colors.white),
        // style: TextStyle(fontsize),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 26, right: 26),
      child: Column(
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
              body(),
              // const SizedBox(
              //   height: 20,
              // ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 60,
            child: Text(
              'category',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
          postContent(),
          const SizedBox(
            height: 20,
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
          Text(
            '$questionCounting 번의 조회 * $answerCounting 개의 답변',
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

/* category 1,2,3,4 == null -> 
category1,2,3,4[]


*/

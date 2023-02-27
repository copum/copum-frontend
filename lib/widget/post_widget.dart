import 'package:copum/api/model/boardmodel.dart';
import 'package:copum/api/provider/boardapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_talk.dart';
import 'package:get/get.dart';

import '../api/model/user_model.dart';
import '../controller/board_controller.dart';
import '../controller/kakao_login_controller.dart';

class PostWidget extends GetView {
  int? pk;
  String title;
  String content;
  int questionCounting;
  String time;

  PostWidget(
      this.pk, this.title, this.content, this.questionCounting, this.time,
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
  Widget body(String profile, String time) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          profile,
          style: const TextStyle(fontSize: 12, color: Colors.white),
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          time,
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
          'pk': pk,
          'title': title,
          'content': content,
          // 'answerCounting': answerCounting,
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

  // late int _boardPk;
  // int get boardpk => _boardPk;

  // boardPk() {
  //   var b = Get.find<BoardController>().dataTest;
  //   int _boardPk = b.pk;
  //   return _boardPk;
  // }

  @override
  Widget build(BuildContext context) {
    var userModel = Get.find<LoginController>().userModel;
    var test = Get.find<BoardController>().dataTest;
    return Container(
      margin: const EdgeInsets.only(left: 26, right: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // const SizedBox(
              //   width: 20,
              // ),
              profileImage(),
              const SizedBox(
                width: 10,
              ),
              body(userModel.profile, time),
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
            '$questionCounting 번의 조회 * answerCounting 개의 답변',
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

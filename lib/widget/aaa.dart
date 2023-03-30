import 'package:copum/controller/answer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//답변 글들 보여지는 ..
class TestWidget extends GetView<AnswerController> {
  int? id;
  String title;
  String content;
  String? answer_created_at;
  String? image;

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

// 포스트 내용
  Widget answerContent(String content) {
    return Text(
      '$content',
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget answerTitle(String title) {
    return Text(
      '$title',
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        color: Colors.black87,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 26, right: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          profileImage(),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.white70),
            padding: const EdgeInsets.only(left: 16, right: 16),
            height: 440,
            width: 280,
            margin: const EdgeInsets.only(right: 60),
            child: GestureDetector(
              onTap: () {
                Get.toNamed('/answer_page', arguments: {
                  'title': title,
                  'content': content,
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    height: 4,
                  ),
                  Text(
                    "질문 제목: ${Get.arguments['title']}",
                    style: const TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                    child: Divider(
                      height: 2,
                      color: Colors.blueGrey,
                    ),
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
          ),
        ],
      ),
    );
  }
}

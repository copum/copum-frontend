import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnswerPage extends GetView {
  int? id;
  late String title;
  late String content;
  String? answer_created_at;
  String? image;

  AnswerPage({Key? key}) : super(key: key);

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
      content,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget answerTitle(String title) {
    return Text(
      '${Get.arguments['title']}',
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          '답변',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 26, right: 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
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
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),

                const SizedBox(
                  height: 30,
                  child: Divider(
                    height: 2,
                    color: Colors.blueGrey,
                  ),
                ),
                answerTitle('${Get.arguments['title']}'),
                const SizedBox(
                  height: 24,
                ),
                answerContent('${Get.arguments['content']}'),
                const SizedBox(
                  height: 8,
                ),
                // 답변 이미지
                Container(
                  alignment: Alignment.center,
                  color: Colors.white,
                  height: 140,
                  width: 250,
                ),
              ],
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


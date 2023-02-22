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
                  height: 26,
                ),
                const Text(
                  '<category>',
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 18,
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
                  // margin: EdgeInsets.only(right: 10),
                  color: Colors.white,
                  height: 140,
                  width: 320,
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              alignment: Alignment.bottomRight,
              margin: const EdgeInsets.only(left: 200),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 48,
                    height: 48,
                    child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed('/answer2');
                        },
                        style:
                            ElevatedButton.styleFrom(primary: Colors.black87),
                        child: const Icon(
                          Icons.question_answer_outlined,
                          color: Colors.white,
                        )),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  SizedBox(
                    width: 48,
                    height: 48,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black87,
                        ),
                        child: const Icon(
                          Icons.check_box_rounded,
                          color: Colors.white,
                        )),
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


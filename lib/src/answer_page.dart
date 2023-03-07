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
      child: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.red,
        child: ClipOval(
          child: Image.network(
            Get.arguments['profile_image'],
            fit: BoxFit.cover,
            width: 40,
            height: 40,
          ),
        ),
      ),
    );
  }

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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    profileImage(),
                    const SizedBox(
                      width: 10,
                    ),
                    body(
                      Get.arguments['profile'],
                      Get.arguments['answer_created_at'],
                    ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
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


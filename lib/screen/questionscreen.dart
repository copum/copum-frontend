import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class QuestionScreen extends StatelessWidget {
  String aa = 'python';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          '질문하기',
          style: TextStyle(
            fontFamily: 'Elice',
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.toNamed('/board');
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          TextButton(
              onPressed: () {
                // 글 게시
              },
              child: const Text(
                '완료',
                style: TextStyle(
                    fontFamily: 'Elice', fontSize: 12, color: Colors.grey),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, top: 32),
              child: const Text(
                '태그',
                style: TextStyle(
                  fontFamily: 'Elice',
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              margin: const EdgeInsets.only(left: 18),
              width: 120,
              height: 40,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Colors.grey,
              ),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  '<$aa>',
                  style: const TextStyle(
                      color: Colors.red, fontFamily: 'Elice', fontSize: 14),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, top: 32),
              child: const Text(
                '제목',
                style: TextStyle(
                  fontFamily: 'Elice',
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                fillColor: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

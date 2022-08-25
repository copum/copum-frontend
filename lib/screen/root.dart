import 'package:copum/controller/root_controller.dart';
import 'package:copum/src/question.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../src/Search.dart';
import '../src/home.dart';
import '../src/profile.dart';

class Root extends GetView<RootController> {
  final user;
  Root({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            '코품',
            style: TextStyle(fontFamily: 'Elice', fontSize: 24),
          ),
        ),
        body: Column(
          children: [
            IndexedStack(
              index: controller.rootPageIndex.value,
              children: const [
                Home(),
                Search(),
                Profile(),
                Question(),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 600),
              child: const Divider(
                height: 1,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          currentIndex: controller.rootPageIndex.value,
          fixedColor: Colors.greenAccent,
          showUnselectedLabels: true,
          // unselectedLabelStyle: const TextStyle(
          //   fontFamily: 'Elice',
          //   fontWeight: FontWeight.bold,
          //   fontSize: 12,
          //   // color: Colors.purple,
          // ),
          selectedLabelStyle: const TextStyle(
            fontFamily: 'Elice',
            fontWeight: FontWeight.bold,
            fontSize: 12,
            //color: Colors.greenAccent
          ),
          onTap: controller.changeRootPageIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.grey),
              label: '홈',
              activeIcon: Icon(
                Icons.home,
                color: Colors.greenAccent,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.grey),
              label: '찾기',
              activeIcon: Icon(
                Icons.search,
                color: Colors.greenAccent,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.grey),
              label: '프로필',
              activeIcon: Icon(
                Icons.person,
                color: Colors.greenAccent,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.question_answer, color: Colors.grey),
              label: '질문하기',
              activeIcon: Icon(
                Icons.question_answer,
                color: Colors.greenAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

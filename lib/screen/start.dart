import 'package:copum/screen/login.dart';
import 'package:copum/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';

//어플 실행했을때 처음 보여지는 화면

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        const Duration(seconds: 2), () => {Get.to(const LoginScreen())});

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: const EdgeInsets.only(left: 90.0),
        child: Column(
          children: const [
            SizedBox(
              height: 250.0,
            ),
            Image(image: AssetImage('assets/images/Service_name.png')),
          ],
        ),
      ),
    );
  }
}

import 'package:copum/binding/kakao_login_binding.dart';
import 'package:copum/controller/root_page_controller.dart';
import 'package:copum/router/routes.dart';
import 'package:copum/screen/answer_screen.dart';
import 'package:copum/screen/question_screen.dart';
import 'package:copum/screen/login_screen.dart';
import 'package:copum/screen/quill_542ver.dart';
import 'package:copum/widget/test.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:get/get.dart';

void main() {
  KakaoSdk.init(nativeAppKey: 'ed5535e02148446b7b2068a4c04bed78');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPages.pages,
      initialRoute: Routes.INTRO,
      theme: ThemeData(primaryColor: Colors.grey),
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder(() {
        Get.put(RootPageController());
      }),
      // home: LoginScreen(),
      //home: const LoginScreen(),
      // home: const Root(),
      //home: const Root(),
      // home: AnswerScreen(),
      // home: Test123(),
    );
  }
}

//test
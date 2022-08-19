import 'package:copum/controller/root_controller.dart';
import 'package:copum/screen/login_screen.dart';
import 'package:copum/screen/root.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:get/get.dart';

void main() {
  KakaoSdk.init(nativeAppKey: 'AIzaSyBXBdTPVPYtci88SBLoHQb8hcrCi1pqtTM');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(primaryColor: Colors.grey),
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder(() {
        Get.put(RootController());
      }),
      //home: StartPage(),
<<<<<<< HEAD
      home: LoginScreen(),
      // home: const Root(),
=======
      //home: const Root(),
      home: const LoginScreen(),
>>>>>>> fc1c257 (kakao 로그인 임시저장)
    );
  }
}

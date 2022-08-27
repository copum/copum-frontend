import 'package:copum/screen/login_screen.dart';
import 'package:copum/screen/register.dart';
import 'package:copum/screen/root.dart';
import 'package:copum/screen/start.dart';
import 'package:copum/src/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../binding/kakao_login_binding.dart';

abstract class Routes {
  static const INTRO = '/'; // 인트로 화면
  static const HOME = '/home'; // (kakao,google 로그인)홈화면
  static const BOARD = '/board'; // 게시판 화면
  static const REGISTER = '/register'; // 회원가입 화면
}

class AppPages {
  static final pages = [
    GetPage(name: Routes.INTRO, page: () => const StartPage()),
    GetPage(
        name: Routes.HOME,
        page: () => const LoginScreen(),
        binding: HomeBinding()),
    GetPage(name: Routes.BOARD, page: () => const Root()),
    GetPage(name: Routes.REGISTER, page: () => const RegisterScreen())
  ];
}

import 'package:copum/api/model/boardmodel.dart';
import 'package:copum/binding/board_binding.dart';
import 'package:copum/binding/root_page_binding.dart';
import 'package:copum/controller/root_page_controller.dart';
import 'package:copum/screen/agreement.dart';
import 'package:copum/screen/board_screen.dart';
import 'package:copum/screen/login_screen.dart';
import 'package:copum/screen/quill_542ver.dart';
import 'package:copum/screen/register.dart';
import 'package:copum/screen/home_screen.dart';
import 'package:copum/screen/start.dart';
import 'package:copum/src/board_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../binding/kakao_login_binding.dart';

abstract class Routes {
  static const INTRO = '/'; // 인트로 화면
  static const LOGIN = '/login'; // (kakao,google 로그인)홈화면
  static const HOME = '/home'; // 게시판 화면
  static const REGISTER = '/register'; // 회원가입 화면
  static const AGREEMENT = '/agreement'; // 약관동의 화면
  static const QUESTION = '/question'; // 질문 화면
  static const SEARCH = '/search'; // 검색 화면
  static const PROFILE = '/profile'; //프로필정보 화면
  static const BOARD = '/board';
}

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.BOARD,
        page: () => const BoardScreen(),
        // page: () => const Quill_542ver(),
        binding: BoardBinding()),
    // GetPage(name: Routes.INTRO, page: () => const StartPage()),
    // GetPage(
    //     name: Routes.LOGIN,
    //     page: () => const LoginScreen(),
    //     binding: HomeBinding()),
    // GetPage(
    //     name: Routes.HOME, page: () => HomeScreen(), binding: BoardBinding()),
    // GetPage(name: Routes.REGISTER, page: () => const RegisterScreen()),
    // GetPage(name: Routes.AGREEMENT, page: (() => const AgreementScreen())),
  ];
}

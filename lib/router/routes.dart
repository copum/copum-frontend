import 'package:copum/api/model/boardmodel.dart';
import 'package:copum/binding/answer_binding.dart';
import 'package:copum/binding/board_binding.dart';
import 'package:copum/binding/root_page_binding.dart';
import 'package:copum/controller/root_page_controller.dart';
import 'package:copum/screen/agreement.dart';
import 'package:copum/screen/answer_screen.dart';

import 'package:copum/screen/login_screen.dart';
import 'package:copum/screen/home_screen.dart';
import 'package:copum/screen/start.dart';
import 'package:copum/src/board_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../binding/kakao_login_binding.dart';
import 'package:copum/screen/question_screen.dart';

import '../screen/answer_main.dart';

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
  static const ANSWER = '/answer';
  static const ANSWER2 = '/answer2';
}

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.BOARD,
        page: () => const QuestionScreen(),
        // page: () => const Quill_542ver(),
        binding: BoardBinding()),
    GetPage(name: Routes.INTRO, page: () => const StartPage()),
    GetPage(
        name: Routes.LOGIN,
        page: () => const LoginScreen(),
        binding: HomeBinding()),
    GetPage(
        name: Routes.HOME, page: () => HomeScreen(), binding: BoardBinding()),
    GetPage(
        name: Routes.ANSWER,
        page: () => AnswerMain(),
        binding: AnswerBinding()),
    GetPage(name: Routes.ANSWER2, page: (() => AnswerScreen()))
  ];
}

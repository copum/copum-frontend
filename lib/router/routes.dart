import 'package:copum/screen/login_screen.dart';
import 'package:copum/screen/start.dart';
import 'package:copum/src/home.dart';
import 'package:get/get.dart';
import '../binding/kakao_login_binding.dart';

abstract class Routes {
  static const INTRO = '/';
  static const HOME = '/home';
}

class AppPages {
  static final pages = [
    GetPage(name: Routes.INTRO, page: () => const StartPage()),
    GetPage(
        name: Routes.HOME,
        page: () => const LoginScreen(),
        binding: HomeBinding()),
  ];
}

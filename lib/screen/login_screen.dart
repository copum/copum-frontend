import 'package:copum/screen/root.dart';
import 'package:path/path.dart' as Path;
import 'package:copum/api/google_signin_api.dart';
import 'package:flutter/material.dart';
import '../controller/kakao_login_controller.dart';
import 'package:get/get.dart';
import 'google_login_screen.dart';
import 'package:http/http.dart' as http;

// class ServerResponse extends Response {
//   bool error;
//   String data;
//   String message;

//   ServerResponse({
//     required this.error,
//     required this.message,
//     required this.data,
//   });
// }

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future signIn() async {
      // final user = await GoogleSignInApi.login();
      // final auth = await user?.authentication;
      // String? accessToken = auth?.accessToken;

      // final serverResult = await http.get(Uri.parse(
      //     "http://localhost:8000/account/google/login?access_token=${accessToken}"));
      // if (serverResult.statusCode != 200) {
      //   Navigator.of(context).pushReplacement(
      //       MaterialPageRoute(builder: (context) => Root(user: user)));
      // } else {
      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     content: Text('Sign in failed'),
      //   ));
      // }

      //이게 서버에 닿기만 하면 됩니다.
      String access_token = "1234";
      final serverResult = await http.get(Uri.parse(
          "http://localhost:8000/account/google/login?access_token=${accessToken}"));
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.fromLTRB(97.0, 192.0, 0.0, 0.0)),
          Center(
            child: RichText(
              text: const TextSpan(
                text: 'Hello,',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Elice"),
                children: <TextSpan>[
                  TextSpan(
                    text: 'World!',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Elice"),
                  ),
                  TextSpan(
                    text: '_',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Elice"),
                  ),
                ],
              ),
            ),
          ),
          const Text(
            '코딩하다 꽉막힐땐 코품!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontFamily: "Elice",
            ),
          ),
          const SizedBox(
            height: 240,
          ),
          ElevatedButton.icon(
            icon: const Padding(
              padding: EdgeInsets.only(right: 80),
              child: Icon(
                Icons.chat_bubble,
                size: 18.0,
                color: Colors.black,
              ),
            ),
            label: const Padding(
              padding: EdgeInsets.only(right: 80),
              child: Text(
                "Kakao로 시작하기",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Elice",
                ),
              ),
            ),
            onPressed: () {
              Get.find<LoginController>().checkLogin();
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.yellow,
              minimumSize: const Size(320, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              elevation: 0.0,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          ElevatedButton.icon(
            icon: const Padding(
              padding: EdgeInsets.only(right: 80),
              child: Icon(
                Icons.email,
                size: 15.0,
                color: Colors.black,
              ),
            ),
            label: const Padding(
              padding: EdgeInsets.only(right: 80),
              child: Text(
                "google로 시작하기",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Elice",
                ),
              ),
            ),
            onPressed: signIn,
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              minimumSize: const Size(320, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              elevation: 0.0,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          ElevatedButton.icon(
            icon: const Padding(
              padding: EdgeInsets.only(right: 80),
              child: Icon(
                Icons.apple,
                size: 18.0,
                color: Colors.black,
              ),
            ),
            label: const Padding(
                padding: EdgeInsets.only(right: 80),
                child: /* GetX<LoginController>(initState: (state) {
                Get.find<LoginController>().checkLogin();
              }, builder: (_) {
                return const Text('test');
              }), */
                    SizedBox.shrink()),
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              minimumSize: const Size(320, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              elevation: 0.0,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          ElevatedButton.icon(
            icon: const Padding(
              padding: EdgeInsets.only(right: 80),
              child: Icon(
                Icons.email,
                size: 18.0,
                color: Colors.black,
              ),
            ),
            label: const Padding(
              padding: EdgeInsets.only(right: 80),
              child: Text(
                "email로 시작하기",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Elice",
                ),
              ),
            ),
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              minimumSize: const Size(320, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              elevation: 0.0,
            ),
          ),
        ],
      ),
    );
  }
}

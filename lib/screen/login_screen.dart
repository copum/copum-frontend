import 'package:copum/api/google_signin_api.dart';
import 'package:flutter/material.dart';
import '../controller/kakao_login.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
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
              KakaoLogin().checkLogin();
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
              child: Text(
                " apple로 시작하기",
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

  Future signIn() async {
    await GoogleSignInApi.login();
  }
}

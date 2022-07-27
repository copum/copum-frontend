import 'package:copum/login/kakao_login.dart';
import 'login/kakao_login.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

void main() {
  KakaoSdk.init(nativeAppKey: '78f94ea53fd455b3cc5ae677e82e0459');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
}

import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import '../widget/password_hint.dart';
import 'intro.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key}) : super(key: key);

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  String inputText = '';
  bool _isVisible = false;
  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  double password_strength = 0;
  final _formKey = GlobalKey<FormState>();

  bool validatePassword(String pass) {
    String _password = pass.trim();
    if (_password.isEmpty) {
      setState(() {
        password_strength = 0;
      });
    } else if (_password.length < 6) {
      setState(() {
        password_strength = 1 / 4;
      });
    } else if (_password.length < 8) {
      setState(() {
        password_strength = 2 / 4;
      });
    } else {
      if (pass_valid.hasMatch(_password)) {
        setState(() {
          password_strength = 4 / 4;
        });
        return true;
      } else {
        setState(() {
          password_strength = 3 / 4;
        });
        return false;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text('회원가입'),
        leading: IconButton(
          onPressed: () {
            // Get.to(StartPage());
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: const Divider(
                height: 1,
                color: Colors.white,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20.0),
              child: const PasswordHint('비밀번호를 입력', '하세요:)'),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              margin: const EdgeInsets.only(left: 15.0),
              child: const Text(
                '비밀번호',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Form(
              key: _formKey,
              // margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Container(
                margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                child: TextFormField(
                  //autovalidateMode: AutovalidateMode.always,
                  onChanged: (text) {
                    setState(() {
                      inputText = text;
                    });
                    _formKey.currentState!.validate();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '영문,숫자,특수문자 중 2개의 조합이 필요해요.\n8자리 이상의 비밀번호가 필요해요.!';
                    } else {
                      bool result = validatePassword(value);
                      if (result) {
                        return null;
                      } else {
                        return '영문,숫자,특수문자 중 2개의 조합이 필요해요.\n8자리 이상의 비밀번호가 필요해요.!';
                      }
                    }
                  },
                  obscureText: !_isVisible, // text 암호화
                  decoration: InputDecoration(
                    errorStyle: TextStyle(
                      color: password_strength >= 2 / 4
                          ? Colors.greenAccent
                          : Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isVisible = !_isVisible;
                          });
                        },
                        icon: _isVisible
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off)),
                    hintText: '8자리 이상, 영문,숫자,특수기호 조합',
                    filled: true,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    fillColor: Colors.white,
                    errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide:
                          BorderSide(color: Color.fromARGB(164, 244, 67, 54)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: const Text(
                '비밀번호확인',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: "Elice",
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text(
                inputText,
                style: const TextStyle(
                  fontSize: 12,
                  fontFamily: "Elice",
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: const Text(
                '위의 비밀번호가 확실한가요?',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: "Elice",
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(
              height: 330,
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: ElevatedButton(
                  onPressed: () {}, //버튼 이벤트작성
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    minimumSize: const Size(320, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 0.0,
                  ),
                  child: const Text(
                    '다음',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Elice",
                      fontSize: 16,
                      letterSpacing: 1,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

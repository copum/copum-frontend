// 회원가입 페이지
import 'package:copum/api/provider/boardapi.dart';
import 'package:copum/controller/board_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import '../widget/password_hint.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String userName = '';
  bool name_length = false;
  final _formKey = GlobalKey<FormState>();

  bool validateUserName(String name) {
    String registerName = name.trim();
    if (registerName.isEmpty) {
      name_length = false;
    } else if (registerName.length > 3 && registerName.length < 8) {
      name_length = true;
    } else if (registerName.length >= 9) {
      name_length = false;
    }
    return name_length;
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
              child: const PasswordHint('프로필 이름을 입력', '해주세요.'),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              margin: const EdgeInsets.only(left: 15.0),
              child: const Text(
                '이름',
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
                      userName = text;
                    });
                    _formKey.currentState!.validate();
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '코품 이용시 사용할 활동명(익명)이에요.';
                    } else {
                      if (value.length >= 3 && value.length < 9) {
                        name_length = false;
                        return '사용가능한 이름이에요.';
                      } else if (value.length < 3) {
                        name_length = true;
                        return '너무 짧아요.';
                      } else if (value.length >= 9) {
                        name_length = true;
                        return '너무 길어요.';
                      }
                    }
                  },
                  decoration: InputDecoration(
                    errorStyle: TextStyle(
                      color: name_length ? Colors.red : Colors.greenAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                    hintText: '영문/숫자 2~16자, 한글 2~8자',
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
            const SizedBox(height: 412),
            Center(
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: ElevatedButton(
                  onPressed: () {
                    if (!name_length) {
                      Get.toNamed('/home');
                    }
                  }, //버튼 이벤트작성
                  style: ElevatedButton.styleFrom(
                    primary: name_length ? Colors.grey : Colors.red,
                    minimumSize: const Size(320, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 0.0,
                  ),
                  child: const Text(
                    '시작하기',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Elice",
                      fontSize: 16,
                      letterSpacing: 1,
                      color: Colors.white,
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

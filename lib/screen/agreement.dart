import 'package:flutter/material.dart';
import '../widget/agreement_hint.dart';
import '../widget/password_hint.dart';
import 'package:get/get.dart';

class AgreementScreen extends StatelessWidget {
  const AgreementScreen({Key? key}) : super(key: key);

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
      MaterialState.selected
    };
    if (states.any(interactiveStates.contains)) {
      return Color.fromARGB(255, 127, 102, 102);
    }
    return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.grey,
            minimumSize: const Size(320, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
        checkboxTheme: CheckboxThemeData(
            fillColor: MaterialStateProperty.resolveWith(getColor)),
      ),
      home: const AgreementPage(),
    );
  }
}

class AgreementPage extends StatefulWidget {
  const AgreementPage({Key? key}) : super(key: key);

  @override
  State<AgreementPage> createState() => _AgreementPageState();
}

class _AgreementPageState extends State<AgreementPage> {
  bool isChecked = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isButtonActive = true;

  bool checkedAll() {
    return (isChecked && isChecked2 && isChecked3);
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
              //Get.to(Login());
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 24.0),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20.0),
              child: const PasswordHint(' 약관동의', '가 필요해요:)'),
            ),
            Container(
              margin: const EdgeInsets.only(left: 36, top: 50),
              child: Row(
                children: [
                  const AgreementHint('(필수)', ' 서비스 이용약관'),
                  Padding(
                    padding: const EdgeInsets.only(left: 110),
                    child: Checkbox(
                        value: isChecked,
                        checkColor: Colors.yellow,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                            checkedAll();
                          });
                        }),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 36, top: 30),
              child: Row(
                children: [
                  const AgreementHint('(필수)', ' 개인정보 수집/이용 동의'),
                  Padding(
                    padding: const EdgeInsets.only(left: 54),
                    child: Checkbox(
                        value: isChecked2,
                        checkColor: Colors.yellow,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked2 = value!;
                            checkedAll();
                          });
                        }),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 36, top: 30),
              child: Row(
                children: [
                  const Text(
                    '모두 확인,동의합니다.',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Elice',
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 130),
                    child: Checkbox(
                        value: isChecked3,
                        checkColor: Colors.yellow,
                        onChanged: (value) {
                          setState(() {
                            isChecked3 = value!;
                            checkedAll();
                          });
                        }),
                  )
                ],
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 311),
                child: ElevatedButton(
                  onPressed: () {
                    if (checkedAll()) {
                      Get.toNamed('/register');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: checkedAll() ? Colors.red : Colors.grey,
                    minimumSize: const Size(320, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: const Text(
                    '다음',
                    style: TextStyle(
                      fontFamily: "Elice",
                      fontSize: 16,
                      letterSpacing: 1.0,
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

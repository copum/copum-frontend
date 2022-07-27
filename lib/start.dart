import 'package:flutter/material.dart';

//어플 실행했을때 처음 보여지는 화면

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: const [
            SizedBox(
              height: 261.0,
            ),
            Image(image: AssetImage('assets/images/Service_name.png')),
          ],
        ),
      ),
    );
  }
}

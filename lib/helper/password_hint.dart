import 'package:flutter/material.dart';

/// 비밀번호 입력창 위 텍스트 문구
class PasswordHint extends StatelessWidget {
  final String first;
  final String second;
  final double size = 20;

  const PasswordHint(this.first, this.second, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text.rich(TextSpan(children: [
        TextSpan(
            text: first, style: TextStyle(color: Colors.green, fontSize: size)),
        TextSpan(
            text: second, style: TextStyle(color: Colors.white, fontSize: size))
      ]))
    ]);
  }
}

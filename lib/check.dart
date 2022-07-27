// import 'package:flutter/material.dart';

// class CheckPassword {
//   String? checkPassword(FocusNode focusNode, String value) {
//     if (value.isEmpty) {
//       focusNode.requestFocus();
//       return '비밀번호를 입력하세요';
//     } else {
//       Pattern pattern =
//           r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?~^<>,.&+=])[A-Za-z\d$@$!%*#?~^<>,.&+=]{8,15}$';
//       RegExp regExp = new RegExp(pattern);
//       if (!regExp.hasMatch(value)) {
//         focusNode.requestFocus();
//       } else {
//         return null;
//       }
//     }
//   }
// }


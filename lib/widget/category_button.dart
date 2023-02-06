import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_template.dart';

class CategoryButton extends StatelessWidget {
  final int index;
  final String text;
  bool checked;
  final void Function(int? idx)? callback;

  CategoryButton({
    required this.index,
    required this.text,
    this.checked = false,
    this.callback = null,
  });

  // const CategoryButton({super.key, required this.name, required this.checked});
  // final bool checked;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: checked ? Colors.black : Colors.grey[800],
            border: Border.all(
                width: 1, color: checked ? Colors.amber[50]! : Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        margin: EdgeInsets.all(10),
        child: InkWell(
          child: Container(
            // color: checked! ? Colors.amber : Colors.red,
            padding: EdgeInsets.all(12.0),
            child: Text(
              "${text}",
              style: TextStyle(
                  color: Colors.amber[200], fontWeight: FontWeight.w400),
            ),
          ),
          onTap: () {
            if (callback != null) callback!(index);
          },
        ));
  }
}

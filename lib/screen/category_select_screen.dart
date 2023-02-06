import 'package:copum/api/model/category_model.dart';
import 'package:copum/widget/category_button.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_template.dart';

class CategorySelectScreen extends StatefulWidget {
  const CategorySelectScreen({super.key});

  @override
  State<CategorySelectScreen> createState() => _CategorySelectScreen();
}

class _CategorySelectScreen extends State<CategorySelectScreen> {
  List<Category> category = [];
  List<bool> checked = [];
  @override
  void initState() {
    category = [
      Category(id: 1, name: 'PHP'),
      Category(id: 2, name: 'JAVA'),
      Category(id: 3, name: 'MySQL'),
      Category(id: 4, name: 'Go'),
      Category(id: 1, name: 'R'),
      Category(id: 2, name: 'C++'),
      Category(id: 3, name: 'MySQL'),
      Category(id: 4, name: 'JavaScript'),
      Category(id: 1, name: 'PHP'),
      Category(id: 2, name: 'JAVA'),
      Category(id: 3, name: 'MySQL'),
      Category(id: 4, name: 'Dart'),
      Category(id: 1, name: 'PHP'),
      Category(id: 2, name: 'JAVA'),
      Category(id: 3, name: 'MySQL'),
      Category(id: 4, name: 'Dart'),
      Category(id: 1, name: 'PHP'),
      Category(id: 2, name: 'JAVA'),
      Category(id: 3, name: 'MySQL'),
      Category(id: 4, name: 'Dart'),
    ];

    checked = category.map((c) {
      return false;
    }).toList();

    super.initState();
  }

  void onPress(int? idx) {
    if (idx == null) return;
    print("checked ${idx}");
    setState(() {
      print("${checked[idx]} to ${!checked[idx]}");
      checked[idx] = !checked[idx];
      print(checked);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          // crossAxisAlignment:,
          children: [
            SizedBox(
              height: 60,
            ),
            header_title(),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  Wrap(
                    direction: Axis.horizontal,
                    children: List.generate(
                      category.length,
                      (index) => CategoryButton(
                          index: index,
                          text: category[index].name,
                          checked: checked[index],
                          callback: onPress),
                    ),
                  )
                ],
              ),
            ),
          ]),
    );
  }

  Widget header_title() {
    return Container(
        margin: EdgeInsets.only(left: 10),
        child: Column(children: [
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: '이미 알고 있거나\n',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300)),
            TextSpan(
                text: '공부중인 ',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300)),
            TextSpan(
                text: '언어를 선택',
                style: TextStyle(
                    color: Colors.green[400],
                    fontSize: 25,
                    fontWeight: FontWeight.w300)),
            TextSpan(
              text: '해주세요\n',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w300,
              ),
            ),
            TextSpan(
                text: '(복수 선택 가능)',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300)),
          ]))
        ]));
  }
}

import 'package:flutter/material.dart';

class CategoryMenu extends StatefulWidget {
  const CategoryMenu({Key? key}) : super(key: key);

  @override
  State<CategoryMenu> createState() => _CategoryMenuState();
}

class _CategoryMenuState extends State<CategoryMenu> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.only(top: 21, left: 20),
            width: 50,
            height: 22,
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: const Text(
              'My QnA',
              style: TextStyle(
                fontFamily: 'Elice',
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            print('aa');
          },
          child: Container(
            margin: const EdgeInsets.only(top: 21, left: 50),
            width: 50,
            height: 22,
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: const Text(
              'NewQ',
              style: TextStyle(
                fontFamily: 'Elice',
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            print('aa');
          },
          child: Container(
            margin: const EdgeInsets.only(top: 21, left: 52),
            width: 50,
            height: 22,
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: const Text(
              'HardQ',
              style: TextStyle(
                fontFamily: 'Elice',
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            print('aa');
          },
          child: Container(
            margin: const EdgeInsets.only(top: 21, left: 50),
            width: 50,
            height: 22,
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: const Text(
              'FAQ',
              style: TextStyle(
                fontFamily: 'Elice',
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

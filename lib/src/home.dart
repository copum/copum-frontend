import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/route_manager.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  // Widget _list() {
  //   return Expanded(
  //     child: SingleChildScrollView(
  //       child: Column(
  //         children: List.generate(
  //           10,
  //           (index) => Container(
  //             margin: const EdgeInsets.all(10),
  //             height: 100,
  //             decoration: const BoxDecoration(
  //               color: Colors.grey,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _CategoryMenu() {
    return Wrap(
      children: [
        Container(
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
        Container(
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
        Container(
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
        Container(
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
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CategoryMenu(),
        // Expanded(
        //   child: _list(),
        // ),
      ],
    );
  }
}

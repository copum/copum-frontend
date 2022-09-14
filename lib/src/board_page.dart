import 'package:copum/api/model/boardmodel.dart';
import 'package:copum/controller/board_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';
import 'package:copum/widget/category_menu.dart';

class BoardPage extends GetView<BoardController> {
  BoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoryMenu(),
        GetX<BoardController>(initState: (state) {
          Get.find<BoardController>().fetchBoard();
        }, builder: (_) {
          return _.boardModel.length < 1
              ? CircularProgressIndicator()
              : ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        _.boardModel.value[index].title ?? 'a',
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  },
                  itemCount: _.boardModel.value.length,
                );
        }),
      ],
    );
  }
}

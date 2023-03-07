import 'dart:convert';
import 'package:copum/api/model/boardmodel.dart';
import 'package:copum/controller/board_controller.dart';
import 'package:copum/widget/post_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';

class CategoryMenu extends StatefulWidget {
  const CategoryMenu({Key? key}) : super(key: key);
  @override
  State<CategoryMenu> createState() => _CategoryMenuState();
}

class _CategoryMenuState extends State<CategoryMenu> {
  bool myQisClicked = false;
  bool newQisClicked = false;
  bool hardQisClicked = false;
  bool faQisClicked = false;

  QuillController _controller = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {});
          },
          child: Container(
            margin: const EdgeInsets.only(top: 21, left: 20),
            width: 50,
            height: 22,
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Text(
              'My QnA',
              style: TextStyle(
                fontFamily: 'Elice',
                fontSize: 14,
                color: myQisClicked ? Colors.white : Colors.grey,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              newQisClicked = true;
            });

            Get.find<BoardController>().fetchBoard();
            GetX<BoardController>(
              initState: (state) {
                Get.find<BoardController>().fetchBoard();
              },
              builder: (_) {
                return _.boardModel.length < 1
                    ? CircularProgressIndicator()
                    : SizedBox(
                        height: 580,
                        child: Obx(
                          () => ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              try {
                                dynamic A = _.boardModel[index].content;
                                var myJSON = jsonDecode(A);
                                _controller = QuillController(
                                    document: Document.fromJson(myJSON),
                                    selection:
                                        TextSelection.collapsed(offset: 0));
                                var a = _controller.document.toPlainText();
                                // print('values: $myJSON');
                                // print('$a');
                                _.boardModel.value[index].content = a;
                                // return _.boardModel[index].content;
                              } catch (e) {
                                print(e);
                              }
                              // dynamic _controller = QuillController(
                              // document: Document.fromJson(myJSON),``
                              // selection: TextSelection.collapsed(offset: 0));
                              return SingleChildScrollView(
                                child: PostWidget(
                                  _.boardModel.value[index].pk,
                                  _.boardModel.value[index].Author["user_id"],
                                  _.boardModel.value[index]
                                      .Author["profile_image"],
                                  _.boardModel.value[index].title,
                                  _.boardModel.value[index].content,

                                  // _.boardModel.value[index].answerCounting,
                                  _.boardModel.value[index].questionCounting,
                                  _.boardModel.value[index].question_created_at,
                                  _.boardModel.value[index].answerCounting,
                                  _.boardModel.value[index].image,
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => const Divider(
                              height: 40,
                              color: Colors.grey,
                            ),
                            itemCount: _.boardModel.value.length,
                          ),
                        ));
              },
            );
          },
          child: Container(
            margin: const EdgeInsets.only(top: 21, left: 50),
            width: 50,
            height: 22,
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Text(
              'NewQ',
              style: TextStyle(
                  fontFamily: 'Elice',
                  fontSize: 14,
                  color: newQisClicked ? Colors.white : Colors.grey),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.only(top: 21, left: 52),
            width: 50,
            height: 22,
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Text(
              'HardQ',
              style: TextStyle(
                fontFamily: 'Elice',
                fontSize: 14,
                color: hardQisClicked ? Colors.white : Colors.grey,
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
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

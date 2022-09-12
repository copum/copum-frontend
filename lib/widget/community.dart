import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import '../screen/home_screen.dart';

class Community extends StatelessWidget {
  const Community({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomeScreen(
          // user: null,
          ),
    );
  }
}

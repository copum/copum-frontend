import 'package:flutter/material.dart';

Widget tmp(){
  return Container(
    margin: EdgeInsets.only(bottom: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("태그",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 56, 59, 61)),
              padding: EdgeInsets.all(10),
              child: Text(
                "<프로그래밍기초>",
                style: TextStyle(color: Colors.orange),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 56, 59, 61)),
              padding: EdgeInsets.all(10),
              child: Text(
                "<JAVA>",
                style: TextStyle(color: Colors.orange),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 56, 59, 61)),
              padding: EdgeInsets.all(10),
              child: Text(
                "+",
                style: TextStyle(color: Colors.orange),
              ),
            ),
          ],
        )
      ],
    ),
  );
}
import 'package:copum/api/google_signin_api.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'login_screen.dart';

class LogggedInPage extends StatelessWidget {
  final GoogleSignInAccount user;
  LogggedInPage({
    Key? key,
    required this.user,
  }) : super(key: key) {
    print(this.user);
  }
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('logged in'),
          centerTitle: true,
          actions: [
            TextButton(
              child: Text('logout'),
              onPressed: () async {
                await GoogleSignInApi.logout();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: ((context) => LoginScreen())));
              },
            )
          ],
        ),
        body: Container(
          alignment: Alignment.center,
          color: Colors.blueGrey.shade900,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Profile',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(
                height: 32,
              ),
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.black,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Name: ' + user.displayName!,
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Email: ' + user.email,
                style: TextStyle(color: Colors.white, fontSize: 24),// 01067359562
              ),
            ],
          ),
        ),
      );
}

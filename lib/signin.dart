import 'package:bookmyden_uapp/home.dart';
import 'package:bookmyden_uapp/homepage.dart';
import 'package:bookmyden_uapp/login_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class signin extends StatefulWidget {
  const signin({Key? key}) : super(key: key);

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  @override
  bool islogin = true;
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomePages();
        } else
          return islogin
              ? login_wid(onClickedSignUp: toggle)
              : sign_up(onClickedLogin: toggle);
      },
    ));
  }

  void toggle() => setState(() {
        islogin = !islogin;
      });
}

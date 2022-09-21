import 'package:bookmyden_uapp/signin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class login_wid extends StatefulWidget {
  void Function() onClickedSignUp;
  login_wid({Key? key, required this.onClickedSignUp}) : super(key: key);

  @override
  State<login_wid> createState() => _login_widState();
}

class _login_widState extends State<login_wid> {
  @override
  final email = TextEditingController();
  final pass = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScopeNode curr = FocusScope.of(context);

          if (!curr.hasPrimaryFocus) {
            curr.unfocus();
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: email,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(labelText: "Enter Email"),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: pass,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(labelText: "Enter Password"),
              ),
              ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: email.text.trim(), password: pass.text.trim());
                  },
                  child: Text("Sign In")),
              SizedBox(
                height: 20,
              ),
              RichText(
                  text: TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      text: 'Dont Have an account? ',
                      children: [
                    TextSpan(
                      style: TextStyle(color: Colors.teal, fontSize: 20),
                      recognizer: TapGestureRecognizer()
                        ..onTap = widget.onClickedSignUp,
                      text: 'Sign Up',
                    )
                  ])),
            ],
          ),
        ),
      ),
    );
  }
}

class sign_up extends StatefulWidget {
  void Function() onClickedLogin;
  sign_up({Key? key, required this.onClickedLogin}) : super(key: key);

  @override
  State<sign_up> createState() => sign_upState();
}

class sign_upState extends State<sign_up> {
  @override
  final email = TextEditingController();
  final pass = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScopeNode curr = FocusScope.of(context);

          if (!curr.hasPrimaryFocus) {
            curr.unfocus();
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: email,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(labelText: "Enter Email"),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: pass,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(labelText: "Enter Password"),
              ),
              ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: email.text.trim(), password: pass.text.trim());
                  },
                  child: Text("Sign Up")),
              SizedBox(
                height: 20,
              ),
              RichText(
                  text: TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      text: 'Already Have an account? ',
                      children: [
                    TextSpan(
                      style: TextStyle(color: Colors.teal, fontSize: 20),
                      recognizer: TapGestureRecognizer()
                        ..onTap = widget.onClickedLogin,
                      text: 'Log In',
                    )
                  ])),
            ],
          ),
        ),
      ),
    );
  }
}

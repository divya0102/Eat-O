import 'dart:io';

import 'package:eato/screens/SessionMnagement.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:eato/pallete.dart';
import 'package:eato/widgets/widgets.dart';
import '';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailCtrl = TextEditingController();

  final TextEditingController _passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(
          image: 'assets/images/login_bg.png',
        ),
        Scaffold(
          backgroundColor: Colors.black.withOpacity(0.02),
          body: SafeArea(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Flexible(
                    child: Center(
                      child: Text(
                        'Welcome back..!',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextInputField(
                        icon: FontAwesomeIcons.envelope,
                        hint: 'Email',
                        inputType: TextInputType.emailAddress,
                        inputAction: TextInputAction.next,
                        controller: _emailCtrl,
                      ),
                      PasswordInput(
                        icon: FontAwesomeIcons.lock,
                        hint: 'Password',
                        inputAction: TextInputAction.done,
                        controller: _passCtrl,
                      ),
                      GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(context, 'ForgotPassword'),
                        child: Text(
                          'Forgot Password',
                          style: kBodyText,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        height: size.height * 0.08,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: kBlue,
                        ),
                        // ignore: deprecated_member_use
                        child: FlatButton(
                          onPressed:performLogin,
                          child: Text(
                            'Login',
                            style:
                                kBodyText.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushReplacementNamed(context, 'CreateNewAccount'),
                    child: Container(
                      child: Text(
                        'Create New Account',
                        style: kBodyText,
                      ),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(width: 1, color: kWhite))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  void performLogin() async {
    if (_formKey.currentState.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: _emailCtrl.text, password: _passCtrl.text);
        User user = userCredential.user;
        if (user.emailVerified) {
          notifyUser(context, 'Login successful');
          SessionManagement.storeLogin(uid: user.uid);
          Navigator.pushReplacementNamed(context,'Homepage');
        } else {
          notifyUser(context, 'Need to verify email');
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          notifyUser(context, 'No user found for that email');
        } else if (e.code == 'wrong-password') {
          notifyUser(context, 'Password Incorrect!');
        }
      }
    }
  }

  void notifyUser(BuildContext context, String s) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(s),
    ));
  }
}

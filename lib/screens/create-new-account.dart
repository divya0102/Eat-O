import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eato/widgets/confirmPassword-input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:eato/pallete.dart';
import 'package:eato/widgets/widgets.dart';

class CreateNewAccount extends StatefulWidget {
  @override
  _CreateNewAccountState createState() => _CreateNewAccountState();
}

class _CreateNewAccountState extends State<CreateNewAccount> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameCtrl = TextEditingController();

  final TextEditingController _emailCtrl = TextEditingController();

  final TextEditingController _passCtrl = TextEditingController();
  final TextEditingController _confirmpassCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(image: 'assets/images/register_bg.png'),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                ),
                Stack(
                  children: [
                    Center(
                      child: Text(
                        'Nice to meet you..!',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.width * 0.2,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      UserInputField(
                        icon: FontAwesomeIcons.user,
                        hint: 'User',
                        inputType: TextInputType.name,
                        inputAction: TextInputAction.next,
                        controller: _nameCtrl,
                      ),
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
                        inputAction: TextInputAction.next,
                        controller: _passCtrl,
                      ),
                      ConfirmPasswordInput(
                        icon: FontAwesomeIcons.lock,
                        hint: 'Confirm Password',
                        inputAction: TextInputAction.done,
                        controller: _confirmpassCtrl,
                        contcheck:_passCtrl,
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
                          onPressed: performSignup,
                          child: Text(
                            'Register',
                            style:
                                kBodyText.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: kBodyText,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(context, 'LoginScreen');
                            },
                            child: Text(
                              'Login',
                              style: kBodyText.copyWith(
                                  color: kBlue, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  void performSignup() async {
    String name = _nameCtrl.text;
    String email = _emailCtrl.text;
    String pass = _passCtrl.text;
    if (_formKey.currentState.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: pass);
        User _currentUser = userCredential.user;
        _currentUser.sendEmailVerification(); //to verify user using a link
        storeUserDetails(_currentUser.uid, name, email);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          notifyUser(context, 'The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          notifyUser(context, 'The account already exists for that email.');
        }
      } catch (e) {
        notifyUser(context, e);
      }
    }
  }

  void notifyUser(BuildContext context, String s) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(s),
    ));
  }

  void storeUserDetails(String uid, String name, String email) async {
    Map<String, dynamic> userDetails = {
      'name': name,
      'email': email,
      'image': "",
      'phone' : "",
      'address': "",
    };
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set(userDetails)
        .then((_) { notifyUser(context, 'user registered');
    Navigator.pushReplacementNamed(context,'LoginScreen');})
        .catchError((onError) => notifyUser(context, onError));
  }
}

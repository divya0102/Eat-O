import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:eato/pallete.dart';
import 'package:eato/widgets/background-image.dart';
import 'package:eato/widgets/rounded-button.dart';
import 'package:eato/widgets/text-field-input.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(image: 'assets/images/login_bg.png'),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: kWhite,
              ),
            ),
            title: Text(
              'Forgot Password',
              style: kBodyText,
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                      Container(
                        width: size.width * 0.8,
                        child: Text(
                          'Enter your email we will send instruction to reset your password',
                          style: kBodyText,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextInputField(
                        icon: FontAwesomeIcons.envelope,
                        hint: 'Email',
                        inputType: TextInputType.emailAddress,
                        inputAction: TextInputAction.done,
                        controller: _emailCtrl,

                      ),
                      SizedBox(
                        height: 20,
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
                          onPressed: performEmailverify,
                          child: Text(
                            'Send',
                            style:
                                kBodyText.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  void performEmailverify() async {
    if (_formKey.currentState.validate()) {
      FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailCtrl.text)
          .then((value) {
        notifyUser(context, 'Check your mail once');
      });
    }
  }

  void notifyUser(BuildContext context, String s) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(s),
    ));
  }
}

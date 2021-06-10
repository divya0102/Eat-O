import 'package:flutter/material.dart';
import 'package:eato/pallete.dart';

class ConfirmPasswordInput extends StatelessWidget {
  const ConfirmPasswordInput({
    Key key,
    @required this.icon,
    @required this.hint,
    @required this.controller,
    @required this.contcheck,
    this.inputType,
    this.inputAction,
  }) : super(key: key);

  final IconData icon;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final TextEditingController controller;
  final TextEditingController contcheck;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: size.height * 0.08,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.grey[500].withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: TextFormField(

            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Icon(
                  icon,
                  size: 28,
                  color: kWhite,
                ),
              ),
              hintText: hint,
              hintStyle: kBodyText,
            ),
            obscureText: true,
            style: kBodyText,
            keyboardType: inputType,
            textInputAction: inputAction,
            validator: (String input) {
              if (input.isEmpty)
                return 'please enter a password';
              else if (contcheck.text!= controller.text){
                return "Password does not match.";
              }
              return null;
            },

            controller: controller,
          ),
        ),
      ),
    );
  }
}
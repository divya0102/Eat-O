import 'package:flutter/material.dart';
import 'package:eato/pallete.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key key1,
    @required this.buttonName,
    @required this.pushto,
  }) : super(key: key1);

  final String buttonName;
  final String pushto;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kBlue,
      ),
      // ignore: deprecated_member_use
      child: FlatButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context,pushto);

        },
        child: Text(
          buttonName,
          style: kBodyText.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
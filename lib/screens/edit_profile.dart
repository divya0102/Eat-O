import 'package:eato/pallete.dart';

import 'Account.dart';
import 'package:eato/Models/user.dart';
import 'SessionMnagement.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {

  static const ROUTE_EDIT = '/route-edit_profile';

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  final _foKey = GlobalKey<FormState>();
  String userId;
  CollectionReference ref = FirebaseFirestore.instance.collection("users");
  final TextEditingController _phoneCtrl = TextEditingController();
  final TextEditingController _addressCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    // getting user id from local session
    SessionManagement.getLoginUID().then((value) {
      setState(() {
        userId = value;
      });
    });
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: _foKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Edit Profile',
                  style: TextStyle(
                    //fontFamily: 'NewTegomin',
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: kBlue,
                  ),
                ),
                Phone(),
                Address(),
                anotherWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget Phone() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Mobile Number ',
          hintText: 'Enter your mobile no.',
        ),
          keyboardType: TextInputType.phone,
          validator: (String input) {
            if (!(input.length ==10))
              return 'Enter correct mobile no.';
            return null;
          },

        controller: _phoneCtrl,
      ),
    );
  }

  Widget Address() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 25.0),
        child: TextFormField(
          decoration: InputDecoration(
              labelText: 'Location ',
              hintText: 'Enter your address',
          ),
          keyboardType: TextInputType.text,
          validator: (String input){
            if(input.length < 3)
              return 'Please enter valid address';
            return null;
          },
          controller: _addressCtrl,
        ),
    );
  }

   Widget anotherWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(onPressed: () {
          updateData();
          Navigator.pushReplacementNamed(
          context, Account.ROUTE_NEXT);},
          child: Text('Save and Continue',
            style: TextStyle(
//              //fontFamily: 'NewTegomin',
            ),


          ),
          ),
      ],
    );
  }

  updateData() async{
    Map<String, dynamic> updateData = {
      'phone': _phoneCtrl.text,
      'address': _addressCtrl.text,
    };
    ref.doc(userId).update(updateData).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('profile updated'),
        ),
      );},
    ); }

}










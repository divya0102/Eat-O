//import 'dart:html';
import 'dart:io';
import 'package:eato/pallete.dart';
import 'package:eato/screens/screens.dart';
import 'edit_profile.dart';
import 'SessionMnagement.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Account extends StatefulWidget {
  static const ROUTE_NEXT = '/route-account';
  final String userId;
  Account({this.userId});
  //CollectionReference ref = FirebaseFirestore.instance.collection("users");

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  File _dpFile;
  String userId;
   //String imgurl;
  CollectionReference ref = FirebaseFirestore.instance.collection("users");

  @override
  void initState() {
    super.initState();
    // getting user id from local session
    SessionManagement.getLoginUID().then((value) {
      setState(() {
        userId = value;
      });

    });
    //image();
  }

  void changeDP(ImageSource imgSrc) async {
    final pickedFile = await ImagePicker().getImage(source: imgSrc);

   await setState(() {
      if (pickedFile != null) {
        _dpFile = File(pickedFile.path);
        storeInServer();
      } else {
        print('No image selected,');
      }
    });
  }

  void updateDB(String imgUrl) async {
    // updating firestore
    Map<String, dynamic> updateData = {
      'image': imgUrl,
    };
   await ref.doc(userId).update(updateData).then((value) {
      // updation done
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Profile Updated'),
        ),
      );
    }).catchError((onError) => print(onError));
  }

  void storeInServer() async {
    /// create / update a folder named "profile"
    /// need to save a file with a name as <whatever the user id> .png
    Reference storage = FirebaseStorage.instance.ref('profile/$userId.png');

    await storage.putFile(_dpFile).then(
      (_) async {
        String downloadURL = await storage.getDownloadURL();
        updateDB(downloadURL);
      },
    ).catchError((onError) => print(onError));
  }

  NameView() {
    return FutureBuilder(
      future: ref.doc(userId).get(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }
        if (snapshot.hasData && !snapshot.data.exists) {
          return Text("Document does not exist");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 30,
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  InkWell(
                    child: Icon(
                      Icons.person,
                      color: Colors.blueGrey,
                      size: 18,
                    ),
                  ),
                  Text(
                    "  ${data['name']}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      // fontStyle: FontStyle.italic,
                      //color: Colors.redAccent
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return Text("loading");
      },
    );
  }

  EmailView() {
    return FutureBuilder(
      future: ref.doc(userId).get(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }
        if (snapshot.hasData && !snapshot.data.exists) {
          return Text("Document does not exist");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 30,
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  InkWell(
                      child: Icon(
                    Icons.email_sharp,
                    color: Colors.blueGrey,
                    size: 18,
                  )),
                  Text(
                    "  ${data['email']}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      // fontStyle: FontStyle.italic,
                      //color: Colors.red
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return Text("loading");
      },
    );
  }

  PhoneView() {
    return FutureBuilder(
      future: ref.doc(userId).get(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }
        if (snapshot.hasData && !snapshot.data.exists) {
          return Text("Document does not exist");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 30,
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  InkWell(
                      child: Icon(
                    Icons.phone,
                    color: Colors.blueGrey,
                    size: 18,
                  )),
                  Text(
                    "  ${data['phone']}",
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return Text("loading");
      },
    );
  }

  AddressView() {
    return FutureBuilder(
      future: ref.doc(userId).get(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }
        if (snapshot.hasData && !snapshot.data.exists) {
          return Text("Document does not exist");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 30,
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  InkWell(
                      child: Icon(
                    Icons.add_location,
                    color: Colors.blueGrey,
                    size: 18,
                  )),
                  Text(
                    "  ${data['address']}",
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      // fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return Text("loading");
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        elevation: 0,
        title: Text(
          "My Profile",
          style: TextStyle(
              color: Color(0xFF3a3737),
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
        leading: Image.asset(
          'assets/images/logo1.png',
          fit: BoxFit.contain,
        ),
        brightness: Brightness.light,
        actions: <Widget>[
          PopupOptionMenu(),
        ],
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: Column(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Stack(
                        fit: StackFit.loose,
                        alignment: AlignmentDirectional.bottomEnd,
                        children: <Widget>[
                           CircleAvatar(
                                backgroundImage: _dpFile == null ?
                               // NetworkImage("${imgurl}")
                                     NetworkImage('https://i.pinimg.com/474x/b8/3a/bb/b83abbca857139568bb690c69d7bad68.jpg')
                                        :
                                FileImage(_dpFile),

                                radius: 60,

                              ),
                         // image(),

                          Positioned(
                            bottom: 1,
                            right: 1,
                            child: Container(
                              height: 30,
                              width: 30,
                              //color: Colors.redAccent,
                              child: FloatingActionButton(
                                backgroundColor: kBlue,
                                onPressed: showModal,
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ]),
                  ),
                ]),
              ),
              Container(
                child: Column(children: <Widget>[
                  NameView(),
                  EmailView(),
                  PhoneView(),
                  AddressView(),
                  anotherWidget(),
                  //showExistingInfo(),
                  //showExistingInfo(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showModal() {
    showModalBottomSheet(
      context: context,
      builder: (build) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.grey[700],
                  size: 50,
                ),
                onTap: () {
                  changeDP(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
              InkWell(
                child: Icon(
                  Icons.library_add,
                  color: Colors.grey[700],
                  size: 50,
                ),
                onTap: () {
                  changeDP(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget anotherWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            //code to route to sign up screen
            Navigator.pushReplacementNamed(context, EditProfile.ROUTE_EDIT);
          },
          child: Text(
            'Edit Profile',
            style: TextStyle(
              // fontStyle: FontStyle.italic,
              color: kBlue,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              //fontFamily: 'NewTegomin',
            ),
          ),
        ),
      ],
    );
  }


}



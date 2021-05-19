import 'package:eato/widgets/background-image.dart';
import 'package:eato/widgets/widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/SessionMnagement.dart';

import '../pallete.dart';

class WelcomeScreen extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: _initialization,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Stack(
          children: [
            BackgroundImage(image: 'assets/images/register_bg.png'),
            Scaffold(
              backgroundColor: Colors.black.withOpacity(0.02),
              body: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(left:30.0),
                  height: 800,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SizedBox(
                        height: 320,
                      ),
                      Text(

                        'Eat-O',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 62,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                          'Binge On Your \nHunger!!',style: TextStyle(
                          color: Colors.white,
                          fontSize: 38,)

                      ),
                      SizedBox(height:20),
                      Text(
                          'Order delicious food from \nyour nearby Restaurants',style: TextStyle(
                        color: Colors.white70,
                        fontSize: 20,)

                      ),
                      SizedBox(height: 160),
                      Container(
                         margin: EdgeInsets.only(left:20.0),
                        height: size.height * 0.08,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(16),
                          color: kBlue,
                        ),
                        // ignore: deprecated_member_use
                        child: FlatButton(
                          onPressed: () {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              performRouting(context);
                            } else {
                              print('error');
                            }
                            ;
                          },
                          child: Text(
                            'Get Started',
                            style:
                                kBodyText.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  void performRouting(BuildContext context) {
    SessionManagement.getLoginStatus().then((value) {
      if (value)
        Navigator.pushReplacementNamed(context, 'Homepage');
      else
        Navigator.pushReplacementNamed(context, 'LoginScreen');
    }).catchError((onError) => print(onError));
  }
}

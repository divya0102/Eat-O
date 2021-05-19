
import 'package:eato/screens/welcome.dart';
import 'file:///C:/Users/user/AndroidStudioProjects/eato/lib/screens/Indian_categories.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/screens.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eat-O',
      theme: ThemeData(
        textTheme:
        GoogleFonts.josefinSansTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) =>WelcomeScreen(),
        'LoginScreen': (context)=> LoginScreen(),
        'ForgotPassword': (context) => ForgotPassword(),
        'CreateNewAccount': (context) => CreateNewAccount(),
        'Homepage':(context)=> HomePage(),
        'Hotelpage':(context)=>hotelPage(),
      },
    );
  }
}
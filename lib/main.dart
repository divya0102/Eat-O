
import 'package:eato/screens/edit_profile.dart';
import 'package:eato/screens/welcome.dart';
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
        'IndianRestaurant':(context)=>Indian_categories(),
        'SouthIndian' : (context)=>SouthIndian_categories(),
        'Bengali' : (context)=> Bengali_categories(),
        'Chinese':(context)=>Chinese_categories(),
        'Continental':(context)=>Continental_categories(),
        'OurTeam':(context)=>Ourteam(),
        Account.ROUTE_NEXT:(context)=>Account(),
        EditProfile.ROUTE_EDIT:(context)=>EditProfile(),
      },
    );
  }
}
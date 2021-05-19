//import 'dart:js';

import 'package:eato/pallete.dart';
import 'package:eato/screens/SessionMnagement.dart';
import 'package:eato/screens/login-screen.dart';
import 'package:flutter/material.dart';
import 'package:eato/annimations/ScaleRoute.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:eato/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String screenTitle = '1st Screen';
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        elevation: 0,
        title: Text(
          "What would you like to eat?",
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
      body: LocalData.bottomNavList[_selectedIndex]['screen'],
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }

  Widget BottomNavBarWidget() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: LocalData.bottomNavList[0]['title'],
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
          ),

          // ignore: deprecated_member_use
          label: LocalData.bottomNavList[1]['title'],
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.card_giftcard),

          // ignore: deprecated_member_use
          label: LocalData.bottomNavList[2]['title'],
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.user,
          ),

          // ignore: deprecated_member_use
          label: LocalData.bottomNavList[3]['title'],
        ),
      ],
      selectedItemColor: Color(0xFFfd5757),
      currentIndex: _selectedIndex,
      onTap: (int cIndex) {
        setState(() {
          _selectedIndex = cIndex;
        });
      },
    );
  }
}

enum MenuOption { MyOrders, TermsAndConditions, Feedback,OurTeam,LogOut }

class PopupOptionMenu extends StatelessWidget {
  const PopupOptionMenu({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuOption>(
      icon: Icon(Icons.delivery_dining,
      ),

      onSelected: (v){
        if(v == MenuOption.LogOut)
          showNotifier(context);
      },
      itemBuilder: (con) {
        return <PopupMenuEntry<MenuOption>>[
          PopupMenuItem(
            child: Wrap(
                crossAxisAlignment:WrapCrossAlignment.center,
                runSpacing:20,
                children: [
                  Icon(Icons.shopping_bag_outlined),
                  Text('  My Orders'),
                ]
            ),
            value:MenuOption.MyOrders,
          ),
          PopupMenuItem(
            child:  Wrap(
                crossAxisAlignment:WrapCrossAlignment.center,
                runSpacing:20,
                children: [
                  Icon(Icons.mail_outline_sharp),
                  Text('  Feedback'),
                ]
            ),
            value: MenuOption.Feedback,
          ),
          PopupMenuItem(
            child:  Wrap(
                crossAxisAlignment:WrapCrossAlignment.center,
                runSpacing:20,
                children: [
                  Icon(Icons.event_note_outlined),
                  Text('  Terms and Conditions'),
                ]
            ),
            value:MenuOption.TermsAndConditions,
          ),
          PopupMenuItem(
            child:  Wrap(
                crossAxisAlignment:WrapCrossAlignment.center,
                runSpacing:20,
                children: [
                  Icon(Icons.group_outlined),
                  Text('  Our Team'),
                ]
            ),
            value: MenuOption.OurTeam,
          ),
          PopupMenuItem(
            value: MenuOption.LogOut,
            child:  Wrap(
                crossAxisAlignment:WrapCrossAlignment.center,
                runSpacing:20,
                children: [
                  Icon(Icons.logout),
                  Text('  LogOut'),
                ]
            ),

          )
        ];
      },
    );
  }

  void showNotifier(BuildContext ctx) {
    showDialog(
      context: ctx,
      barrierDismissible: false, // diabling auto dismiss
      builder: (BuildContext con) => AlertDialog(
        backgroundColor:  Color(0xFFfae3e2),
        title: Text('Logout Dialog'),
        content: Text('Do you really want to sign out?'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.cancel,
              color: kBlue,
            ),
            onPressed: () => Navigator.pop(con),
          ),
          IconButton(
            icon: Icon(Icons.exit_to_app_sharp,color: kBlue,),
            onPressed: () {
              SessionManagement.removeUser().then((value) =>
                  Navigator.pushNamedAndRemoveUntil(
                      ctx, 'LoginScreen', (route) => false));
            },
          ),
        ],
      ),
    );
  }
}

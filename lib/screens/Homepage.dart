//import 'dart:js';
import 'package:flutter_email_sender/flutter_email_sender.dart';
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
       /* BottomNavigationBarItem(
          icon: Icon(Icons.card_giftcard),

          // ignore: deprecated_member_use
          label: LocalData.bottomNavList[2]['title'],
        ),*/
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.user,
          ),

          // ignore: deprecated_member_use
          label: LocalData.bottomNavList[2]['title'],
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
      icon: Icon(Icons.menu,color: Colors.grey[700],
      ),

      onSelected: (v) async {
        if(v == MenuOption.LogOut)
          showNotifier(context);
        else if(v==MenuOption.OurTeam)
          Navigator.pushNamed(context,'OurTeam');
        else if(v==MenuOption.Feedback)
          {
            final Email email=Email(
              body: 'Email body',
              subject: 'Subject',
              recipients: ['divyakumari0102@gmail.com'],
              isHTML: false,
            );
            await FlutterEmailSender.send(email);
          }
      },
      itemBuilder: (con) {
        return <PopupMenuEntry<MenuOption>>[
          PopupMenuItem(
            child: Wrap(
                crossAxisAlignment:WrapCrossAlignment.center,
                runSpacing:20,
                children: [
                  Icon(Icons.shopping_bag_outlined,
                  color:Colors.grey[700],size: 20,),
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
                  Icon(Icons.mail_outline_sharp,color:Colors.grey[700],size: 20,),
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
                  Icon(Icons.event_note_outlined,color:Colors.grey[700],size: 20,),
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
                  Icon(Icons.group_outlined,color:Colors.grey[700],size: 20,),
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
                  Icon(Icons.logout,color:Colors.grey[700],size: 20,),
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

//import 'package:eato/widgets/SearchWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eato/widgets/widgets.dart';
import 'package:search_widget/search_widget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  // bool _show = true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            const SizedBox(
              height: 32,
            ),
           // Text(
             // "${_selectedItem != null ? _selectedItem.username : ""
             //     "No item selected"}",),
            TopMenus(),
            //PopularFoodsWidget(),
            BestFoodWidget(),
          ],
        ),
      ),
    );
  }
}


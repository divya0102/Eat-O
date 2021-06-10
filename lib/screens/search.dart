import 'package:eato/pallete.dart';
import 'package:eato/screens/Restaurant1.dart';
import 'package:eato/screens/screens.dart';
import 'package:flutter/material.dart';
import'package:search_widget/search_widget.dart';
class search extends StatefulWidget{
  @override
  _searchState createState() => _searchState();
}

class _searchState extends State<search> {


    // TODO: implement build
  List<LeaderBoard> list = <LeaderBoard>[
    LeaderBoard("Arsalan","Hotelpage"),
    LeaderBoard("Chicken Biryani","Hotelpage" ),
    LeaderBoard("Fried Rice", "Hotelpage"),
    LeaderBoard("Chicken Curry", "Hotelpage"),
    LeaderBoard("Butter Naan", "Hotelpage"),
    LeaderBoard("Chopstick", " "),
    LeaderBoard("Barbeque Nation", " "),
    LeaderBoard("Mocambo Restaurant and Bar", " "),
    LeaderBoard("Banana Leaf", " "),
    LeaderBoard("Dada Boudi Restaurant", " "),
    LeaderBoard("Noodle Oodle", " "),
    LeaderBoard("Tandoor House", " "),
    LeaderBoard("Oh! Calcuta", " "),
    LeaderBoard("Marco Polo", " "),
    LeaderBoard("Banana Leaf", " "),
    LeaderBoard("Dada Boudi Restaurant", " "),
    LeaderBoard("Noodle Oodle", " "),
    LeaderBoard("Tandoor House", " "),
    LeaderBoard("Oh! Calcuta", " "),
    LeaderBoard("Marco Polo", " "),
    LeaderBoard("Banana Leaf", " "),
    LeaderBoard("Dada Boudi Restaurant", " "),
    LeaderBoard("Noodle Oodle", " "),
    LeaderBoard("Tandoor House", " "),
    LeaderBoard("Oh! Calcuta", " "),
    LeaderBoard("Marco Polo", " "),
    LeaderBoard("Banana Leaf", " "),
    LeaderBoard("Dada Boudi Restaurant", " "),
    LeaderBoard("Noodle Oodle", " "),
    LeaderBoard("Tandoor House", " "),
    LeaderBoard("Oh! Calcuta", " "),
    LeaderBoard("Marco Polo", " "),
    LeaderBoard("Banana Leaf", " "),
    LeaderBoard("Dada Boudi Restaurant", " "),
    LeaderBoard("Noodle Oodle", " "),
    LeaderBoard("Tandoor House", " "),
    LeaderBoard("Oh! Calcuta", " "),
    LeaderBoard("Marco Polo", " "),

  ];

    LeaderBoard _selectedItem;

    bool _show = true;

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
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: <Widget>[
              if (_show)
                SearchWidget(
                  dataList: list,
                  hideSearchBoxWhenItemSelected: false,
                  listContainerHeight: MediaQuery.of(context).size.height / 4,
                  queryBuilder: (query, list) {
                    return list
                        .where((item) => item.username
                        .toLowerCase()
                        .contains(query.toLowerCase()))
                        .toList();
                  },
                  popupListItemBuilder: (item) {
                    return PopupListItemWidget(item);
                  },
                 /* selectedItemBuilder: (selectedItem, deleteSelectedItem) {
                    return SelectedItemWidget(selectedItem, deleteSelectedItem);
                  },*/
                  // widget customization
                  noItemsFoundWidget: NoItemsFound(),
                  textFieldBuilder: (controller, focusNode) {
                    return MyTextField(controller, focusNode);
                  },
                  onItemSelected: (item) {
                    setState(() {
                      _selectedItem = item;
                    });
                  },
                ),
              const SizedBox(
                height: 32,
              ),
            /*  Text(
                "${_selectedItem != null ? _selectedItem.username : ""
                    "No item selected"}",
              ),*/
            ],
          ),
        ),
      );
    }
}
class LeaderBoard {
  LeaderBoard(this.username, this.score);

  final String username;
  final String score;
}

/*class SelectedItemWidget extends StatelessWidget {
  const SelectedItemWidget(this.selectedItem, this.deleteSelectedItem);

  final LeaderBoard selectedItem;
  final VoidCallback deleteSelectedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 4,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 8,
                bottom: 8,
              ),
              child:GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, selectedItem.score),
                child: Text(
                  selectedItem.username,
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.delete_outline, size: 22),
            color: Colors.grey[700],
            onPressed: deleteSelectedItem,
          ),
        ],
      ),
    );
  }
}*/

class MyTextField extends StatelessWidget {
  const MyTextField(this.controller, this.focusNode);

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
            borderSide: BorderSide(
              color: kBlue,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          prefixIcon: Icon(Icons.search, color: kBlue,),
          border: InputBorder.none,
          hintText: "Restaurant name, cuisine, or a dish...",
          contentPadding: const EdgeInsets.only(
            left: 16,
            right: 20,
            top: 14,
            bottom: 14,
          ),
        ),
      ),
    );
  }
}

class NoItemsFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(
          Icons.folder_open,
          size: 24,
          color: Colors.grey[900].withOpacity(0.7),
        ),
        const SizedBox(width: 10),
        Text(
          "No Items Found",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[900].withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}

class PopupListItemWidget extends StatelessWidget {
  const PopupListItemWidget(this.selectedItem);

  final LeaderBoard selectedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: GestureDetector(
        onTap: () =>
            Navigator.pushNamed(context, selectedItem.score),
        child: Text(
          selectedItem.username,
        ),
      ),
    );
  }
}

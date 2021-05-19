import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:eato/screens/screens.dart';

class TopMenus extends StatefulWidget {
  @override
  _TopMenusState createState() => _TopMenusState();
}

class _TopMenusState extends State<TopMenus> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          TopMenuTiles(name: "Indian", imageUrl: "indian", slug: ""),
          TopMenuTiles(
              name: "South Indian", imageUrl: "south-indian", slug: ""),
          TopMenuTiles(name: "Bengali", imageUrl: "bengali", slug: ""),
          TopMenuTiles(name: "Continental", imageUrl: "continental", slug: ""),
          TopMenuTiles(name: "Chinese", imageUrl: "chinese", slug: ""),
          TopMenuTiles(name: "Seafood", imageUrl: "seafood", slug: ""),
          // TopMenuTiles(name: "Burger", imageUrl: "ic_burger", slug: ""),
          //TopMenuTiles(name: "Sushi", imageUrl: "ic_sushi", slug: ""),
        ],
      ),
    );
  }
}

class TopMenuTiles extends StatelessWidget {
  String name;
  String imageUrl;
  String slug;

  TopMenuTiles(
      {Key key,
      @required this.name,
      @required this.imageUrl,
      @required this.slug})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=>Indian_categories())),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 15, right: 5, top: 15, bottom: 5),
            decoration: new BoxDecoration(boxShadow: [
              new BoxShadow(
                color: Color(0xFFfae3e2),
                blurRadius: 20.0,
                offset: Offset(0.0, 0.75),
              ),
            ]),
            child: Column(
              children: [
                Card(
                    color: Colors.white,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                    ),
                    child: Container(
                      width: 85,
                      height: 85,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                          child: Image.asset(
                        'assets/images/topmenu/' + imageUrl + ".png",
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                           // fit: BoxFit.,
                      )),
                    )),
                Text(name,
                    style: TextStyle(
                        color: Color(0xFF6e6e71),
                        fontSize: 20,
                        fontWeight: FontWeight.w400)),
              ],
            ),
          ),

          /* Text(name,
              style: TextStyle(
                  color: Color(0xFF6e6e71),
                  fontSize: 20,
                  fontWeight: Fon-+tWeight.w400)),*/
        ],
      ),
    );
  }
}

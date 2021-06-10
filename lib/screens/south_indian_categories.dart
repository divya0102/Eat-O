import 'package:eato/pallete.dart';
import 'package:flutter/material.dart';
import 'package:eato/screens/Restaurant1.dart';

class SouthIndian_categories extends StatefulWidget {
  @override
  _SouthIndian_categoriesState createState() => _SouthIndian_categoriesState();
}

class _SouthIndian_categoriesState extends State<SouthIndian_categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(

          child: Container(
            height: 900,
            width: double.infinity,
            child: Column(
              children: <Widget>[
                BestFoodTitle1(),
                Expanded(
                  child: BestFoodList1(),
                ),
                SizedBox(
                  height: 70,
                )
              ],
            ),
          ),
        )

    );
  }
}

class BestFoodTitle1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 60, bottom: 5),
      child:
      Text(
        "Restaurants delivering South Indian dishes...",
        style: TextStyle(
            fontSize: 25,
            color: Color(0xFF3a3a3b),
            fontWeight: FontWeight.w300),


      ),
    );
  }
}

class BestFoodTiles1 extends StatelessWidget {
  String name;
  String imageUrl;
  String address;
  String rating;
  String numberOfRating;
  String price;
  String slug;

  BestFoodTiles1(
      {Key key,
        @required this.name,
        @required this.imageUrl,
        @required this.address,
        @required this.rating,
        @required this.numberOfRating,
        @required this.price,
        @required this.slug})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => hotelPage())),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 5),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Color(0xFFF9189),
                blurRadius: 15.0,
                offset: Offset(0, 0.75),
              ),
            ]),
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/bestfoods/' + imageUrl + ".jpeg",
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  ListTile(
                    title: Text(
                      name,
                      textScaleFactor: 1.3,
                    ),
                    subtitle: Text(
                      price,
                      textScaleFactor: 1.1,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          rating,
                          textScaleFactor: 1.2,
                        ),
                        Icon(
                          Icons.star_outlined,
                          color: kBlue,
                        ),
                      ],
                    ),
                    isThreeLine: true,
                  )
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 1,
              margin: EdgeInsets.only(left: 5.0,right: 5.0,top: 0,bottom: 5.0),
            ),
          ),
        ],
      ),
    );
  }
}

class BestFoodList1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        BestFoodTiles1(
            name: "Banana Leaf",
            imageUrl: "ic_best_food_1",
            rating: "4.6",
            price: "Southern Avenue,Kolkata \n\u{20B9}800 for Two",
            slug: ""),
      ],
    );
  }
}

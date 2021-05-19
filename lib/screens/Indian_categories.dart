import 'package:eato/pallete.dart';
import 'package:flutter/material.dart';
import 'package:eato/screens/Restaurant1.dart';

class Indian_categories extends StatefulWidget {
  @override
  _Indian_categoriesState createState() => _Indian_categoriesState();
}

class _Indian_categoriesState extends State<Indian_categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(

       child: Container(
          height: 900,
          width: double.infinity,
          child: Column(
            children: <Widget>[
              BestFoodTitle(),
              Expanded(
                child: BestFoodList(),
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

class BestFoodTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 60, bottom: 0),

       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        child:
          Text(
            "Indian Restaurants",
            style: TextStyle(
                fontSize: 25,
                color: Color(0xFF3a3a3b),
                fontWeight: FontWeight.w300),


      ),
    );
  }
}

class BestFoodTiles extends StatelessWidget {
  String name;
  String imageUrl;
  String address;
  String rating;
  String numberOfRating;
  String price;
  String slug;

  BestFoodTiles(
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
              margin: EdgeInsets.all(5),
            ),
          ),
        ],
      ),
    );
  }
}

class BestFoodList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        BestFoodTiles(
            name: "Arsalan",
            imageUrl: "ic_best_food_1",
            rating: '4.9',
            price: 'South Dumdum,Kolkata  \n600 for Two ',
            slug: "fried_egg"),
        BestFoodTiles(
            name: "Barbeque Nation",
            imageUrl: "ic_best_food_10",
            rating: "4.0",
            numberOfRating: "50",
            price: "Park Street,Kolkata  \n1600 for Two",
            slug: ""),
        BestFoodTiles(
            name: "Tandoor House",
            imageUrl: "ic_best_food_4",
            rating: '4.9',
            price: 'Ballygunj,Kolkata  \n500 for Two',
            slug: "fried_egg"),
      ],
    );
  }
}

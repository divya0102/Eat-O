import 'package:eato/pallete.dart';
import 'package:eato/screens/FoodOrderPage.dart';
import 'package:flutter/material.dart';

/*class HotelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "mont"
      ),
      home: hotelPage(),
    );
  }
}*/
class hotelPage extends StatefulWidget {
  @override
  _hotelPageState createState() => _hotelPageState();
}

class _hotelPageState extends State<hotelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        //  backgroundBlendMode: color(Colors.black.withOpacity(0.2)),
                        /* gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black,
                            Colors.transparent,
                            Colors.transparent,
                            Colors.black
                          ],
                          stops: [0, 0.2, 0.8, 1],
                        ),*/
                        color: Colors.black,
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/restaurant1/arsalan.png"),
                          fit: BoxFit.cover,
                           colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.55), BlendMode.dstATop),
                        ),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        /* Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                icon: Icon(Icons.arrow_back, color: Colors.white,)
                            ),
                            IconButton(
                                icon: Icon(Icons.search, color: Colors.white,)
                            ),
                          ],
                        ),*/
                        SizedBox(
                          height: 120,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Arsalan",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 30),
                                ),
                                SizedBox(height: 5,),
                                Text(
                                  "Indian Cuisine, Aromatic Biryani",
                                  style: TextStyle(color: Colors.white, fontSize: 16),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                    ),
                                    Icon(
                                      Icons.star_half_outlined,
                                      color: Colors.orange,
                                    ),
                                    Text(
                                      " 250 Reviews",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    )
                                  ],
                                )
                              ],
                            ),
                            /*Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white
                              ),
                              child: Center(
                                child: Icon(Icons.favorite,color: Colors.redAccent, size: 35,),
                              ),
                            )*/
                          ],
                        ),

                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Today's Special",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                height: 0.5,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        placesWidget("chicken_curry", "Chicken Curry"),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Dishes",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                height: 0.5,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [dishWidget(Colors.red,
                                "chicken_biryani",
                                  "Chicken Biryani",
                                  "1 piece chicken served in a bowl",
                                  "\u{20B9}250"),
                              dishWidget(Colors.red,"chicken_curry", "Chicken Curry",
                                  "4 piece served in a platter", "\u{20B9}220"),
                              dishWidget(Colors.green,
                                  "fried_rice",
                                  "Fried Rice",
                                  "Aromatic green veggies in a bowl ",
                                  "\u{20B9}300"),
                              dishWidget(Colors.red,
                                  "mutton_biryani",
                                  "Mutton Biryani",
                                  "1 piece mutton served in a bowl",
                                  "\u{20B9}320"),
                              dishWidget(Colors.red,"naan", "Butter Naan",
                                  "Tandoored with butter", "\u{20B9}60"),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                              color: kBlue),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_shopping_cart,
                                  color: Colors.white,
                                  size: 18,
                                ),
                                Text(
                                  " CART",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 45, vertical: 5),
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                            color: kBlue.withOpacity(0.7)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container dishWidget(Color i,
      String img, String name, String description, String price) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // mainAxisAlignment: MainAxisAlignment.end,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  "assets/images/non_veg.png",
                  width: 50,
                  height: 50,
                ),
              ),
              //Icons.circle, color:i, size: 20,),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  "$name",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "$description",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "$price",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                )
              ]),
              Column(children: [
                Container(
                  width: 85,
                  height: 85,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage("assets/images/restaurant1/$img.jpeg"),
                          fit: BoxFit.cover)),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                  decoration: BoxDecoration(
                      color: Color(0xFFfae3e2),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      border: Border.all(color: kBlue)),
                  child: Text(
                    "ADD  +",
                    textScaleFactor: 1.1,
                    style: TextStyle(fontWeight: FontWeight.bold, color: kBlue),
                  ),
                ),
                SizedBox(
                  height: 25,
                )
              ])
            ],
          ),
        ],
      ),
    );
  }

  Row placesWidget(String img, String name) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage("assets/images/restaurant1/$img.jpeg"))),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$name",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star_half_outlined,
                    size: 20,
                    color: Colors.orange,
                  ),
                ],
              ),
              Text(
                "Lorem ipsum sits dolar amet is for publishing",
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                color: kBlue),
            child: Text(
              "Order Now",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
            ),
          ),
        )
      ],
    );
  }
  /* void openCartPage()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>FoodOrderPage()));
  }*/
}

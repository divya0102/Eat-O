import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eato/Models/Dishes.dart';
import 'package:eato/annimations/ScaleRoute.dart';
import 'package:eato/pallete.dart';
import 'package:eato/widgets/background-image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cart.dart';

class hotelPage extends StatefulWidget {
  @override
  _hotelPageState createState() => new _hotelPageState();
}

class _hotelPageState extends State<hotelPage> with ChangeNotifier {
  final List<Dish> _dishes = List<Dish>();

  List<Dish> _cartList = List<Dish>();

  int count = 0;
  CollectionReference ref = FirebaseFirestore.instance.collection('Food');

  @override
  void initState() {
    super.initState();
    _creatlist();

  }
  @override
  void dispose(){
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    notifyListeners();
    return Scaffold(
      body: Stack(children: [
        SingleChildScrollView(
          child: Container(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        image:
                            AssetImage("assets/images/restaurant1/arsalan.png"),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.55), BlendMode.dstATop),
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
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Indian Cuisine, Aromatic Biryani",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
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
                      SizedBox(
                        height: 40,
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
                      ListView.builder(
                          // scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _dishes.length,
                          itemBuilder: (context, int i) {
                            var item = _dishes[i];
                            return Container(
                              height: 150,
                              child: ListTile(
                                //dense: true,
                                horizontalTitleGap: 2.0,
                                // minLeadingWidth: 1,
                                leading: Container(
                                  height: 85,
                                  width: 85,
                                  alignment: Alignment.topLeft,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40.0),
                                      //shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(item.img,
                                              scale: 3.0),
                                          fit: BoxFit.cover)),
                                ),
                                title: Text(
                                  item.item_name,
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700),
                                ),
                                subtitle: Container(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.desc,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          "\u{20B9}${item.price}",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        )
                                      ]),
                                ),
                                trailing: Column(children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 7, horizontal: 20),
                                    decoration: BoxDecoration(
                                        color: (_cartList.contains(item))
                                            ? Colors.grey
                                            : Color(0xFFfae3e2),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                        border: Border.all(
                                            color: (!_cartList.contains(item))
                                                ? kBlue
                                                : Colors.white)),
                                    child: GestureDetector(
                                      child: (!_cartList.contains(item))
                                          ? Text(
                                              "Add",
                                              textScaleFactor: 1.1,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: kBlue),
                                            )
                                          : Text(
                                              "Added",
                                              textScaleFactor: 1.1,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                      onTap: () {
                                        setState(() {
                                          if (!_cartList.contains(item)) {
                                            _cartList.add(item);
                                            count = count + item.price;
                                            notifyListeners();
                                          } else {
                                            _cartList.remove(item);
                                            count = count - item.price;
                                            notifyListeners();
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                ]),
                              ),
                            );
                          }),
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
                      onTap: () {
                        setState(() {
                          if (_cartList.isNotEmpty)
                            Navigator.of(context).push(new MaterialPageRoute(
                              builder: (context) => Cart(_cartList, count),
                            ));
                        });
                        
                       // super.dispose();
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
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
      ]),
    );
  }
  void _creatlist() {
    ref.get().then((QuerySnapshot querysnapshot) {
      querysnapshot.docs.forEach((QueryDocumentSnapshot doc) {
        Dish dish = Dish(
            desc: doc['des'],
            item_name: doc['name'],
            img: doc['image'],
            price: doc['price']);
        setState(() {
          _dishes.add(dish);
        });
      });
    }).catchError((onError) => print(onError));
  }
/* void openCartPage()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>FoodOrderPage()));
  }*/
}

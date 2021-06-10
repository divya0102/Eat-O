import 'package:eato/Models/Dishes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';
import '../pallete.dart';


class Cart extends StatefulWidget {
  final count1;

  final List<Dish> _cart;
  Cart(this._cart, this.count1);

  @override
  _CartState createState() => _CartState(this._cart, this.count1);
}

class _CartState extends State<Cart> with ChangeNotifier {
  _CartState(this._cart, this.count1);
 // CollectionReference ref = FirebaseFirestore.instance.collection('users');
  int count1;
  int dcharge=30;
  List<Dish> _cart;
 @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
       onWillPop: () {
       // ignore: missing_return
        Navigator.pop(context);
       },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFFF5858),
            elevation: 0,
            title: Text(
              'Cart',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
          ),
          body: SingleChildScrollView(
              child: Column(
            children: [
              Container(
                height: 440,
                child: ListView.builder(
                    itemCount: _cart.length,
                    itemBuilder: (context, index) {
                      var item = _cart[index];

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 15.0),
                        child: ListTile(
                          leading: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(70.0),
                                image: DecorationImage(
                                    image: NetworkImage(item.img),
                                    fit: BoxFit.cover)),
                          ),
                          title: Text(item.item_name),
                          subtitle: Text(item.desc),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 7, horizontal: 20),
                                decoration: BoxDecoration(
                                    color: Color(0xFFfae3e2),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    border: Border.all(color: kBlue)),
                                child: GestureDetector(
                                    child: Text(
                                      "Remove",
                                      textScaleFactor: 1.1,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: kBlue),
                                    ),
                                    onTap: () {
                                      setState(() {
                                       // if(_cartList.contains(item))
                                         _cart.remove(item);
                                         count1 = count1 - item.price;
                                         notifyListeners();
                                      });
                                    }),
                              ),
                              Text(
                                "\u{20B9}${item.price}",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'Item Total:                                                                \u{20B9}${count1}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                            ),
                          ),
                        )),
                    Container(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            'Delivery Charge:                                                         \u{20B9}${dcharge}',
                            style: TextStyle(
                              fontSize: 16,

                            ),
                          ),
                        )),
                    Container(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            'Taxes and Charges:                                                  \u{20B9}${(count1*(18/100)).toStringAsFixed(1)}',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        )),
                    Container(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'Order Total:                                            \u{20B9}${(count1*(18/100)+count1+dcharge).round()}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        )),
                    Container(alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 5,top: 10),
                      child: Text(
                        "Payment Method",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w600),
                        textAlign:TextAlign.left,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Color(0xFFfae3e2).withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 1),
                        ),
                      ]),
                      child: Card(
                        color: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(left: 10, right: 30, top: 10, bottom: 10),
                          child: Row(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  "assets/images/menus/cash.png",
                                  width: 60,
                                  height: 60,
                                ),
                              ),
                              Text(
                                "Cash on delivery",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF3a3a3b),
                                    fontWeight: FontWeight.w400),
                                textAlign: TextAlign.left,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: size.height * 0.06,
                      width: size.width * 0.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: kBlue,
                      ),
                      // ignore: deprecated_member_use
                      child: FlatButton(
                        onPressed:(){ _showRatingAppDialog();
                       // super.dispose();
                        },
                        child: Text(
                          'Place Order',
                          style:
                              kBodyText.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ))),
    );
  }



  void _showRatingAppDialog() {
    final _ratingDialog = RatingDialog(
      initialRating: 1,
      ratingColor: Colors.orange,
      title: 'Order Successfully placed!!',
      message: 'Reaching to you soon..'
          '\nRate your order now',
      image: Image.network("https://i.pinimg.com/originals/d1/7e/a3/d17ea3ea4788f8f31733d4de3716e20f.gif",
      ),
      submitButton: 'Submit',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        print('rating: ${response.rating}, '
            'comment: ${response.comment}');
             Navigator.of(context).pushNamedAndRemoveUntil('Homepage', (Route<dynamic> route) => false);
         // super.dispose();

      },
    );

    showDialog(
      context: context,
      barrierDismissible:false,
      builder: (context) => _ratingDialog,
    );
  }
}

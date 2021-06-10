import 'package:eato/pallete.dart';
import 'package:flutter/material.dart';

class Ourteam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlue,
        elevation: 0,
        title: Text(
          "Meet The Team",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: Text(
                    'Eat-O is lovingly build and maintained by these fine folks',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[700],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 360,
                  width: 360,
                  child: Column(
                    children: [
                      Container(
                        height: 220,
                        width: 220,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://firebasestorage.googleapis.com/v0/b/eat-o-ed4c5.appspot.com/o/profile%2FWhatsApp%20Image%202021-06-06%20at%2011.21.14%20AM.jpeg?alt=media&token=ac7747ce-c6a5-488d-9d63-0a3ad6e47025"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.all(Radius.circular(110)),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'Divya Kumari',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600]),
                        ),
                      ),
                      Text(
                        'Information Technology 3rd year Student\nNetaji Subhash Engineering College',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[600]),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'She is passionate about learning new skills and is good in problem solving.',
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        'Contact: divyakumari0102@gmail.com',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: Colors.grey[500]),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(thickness: 1,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 360,
                  width: 360,
                  child: Column(
                    children: [
                      Container(
                        height: 220,
                        width: 220,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://firebasestorage.googleapis.com/v0/b/eat-o-ed4c5.appspot.com/o/profile%2FWhatsApp%20Image%202021-06-06%20at%204.03.57%20PM.jpeg?alt=media&token=886265ea-b3dc-4434-8618-46910137ff2c"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.all(Radius.circular(110)),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'Kashturi Halder',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700]),
                        ),
                      ),
                      Text(
                        'Information Technology 3rd year Student\nNetaji Subhash Engineering College',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[600]),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'She is passionate about learning new skills and is good in problem solving. ',
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        'Contact: simpihalder.13@gmail.com',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: Colors.grey[500]),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

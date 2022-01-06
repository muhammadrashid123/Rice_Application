import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:rice/booking/booking_model.dart';
import 'package:rice/screens/details_page.dart';
import 'package:rice/screens/login.dart';
import 'package:firebase_database/firebase_database.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:cupertino_icons/cupertino_icons.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final referenceData = FirebaseDatabase.instance.reference().child('advance-booking-product');
  // List<ProductDataModel> items=[];
  // // @override
  //  void initState() {
  // //   // TODO: implement initState
  //    super.initState();
  // //
  //    referenceData.once().then((DataSnapshot dataSnapShot){
  //
  //    //  var keys = dataSnapShot.value.keys;
  //      var values = dataSnapShot.value;
  //       items.clear();
  //       values.forEach ((key,value){
  //        ProductDataModel data = new ProductDataModel(
  //               value['coming_date'],
  //                value['description'],
  //            value['name'],
  //            value['price'],
  //              key);
  //        print (value['coming_date']);
  //             items.add(data);
  //        print (items[0]);
  //     });
  //
  //     setState(() {
  //
  //     });
  //   });
  // //
  //  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Advance Booking Application",
            style: TextStyle(
              // this Text
              color: Color(0xff636363),
              fontSize: 22,
            ),
          ),
          backgroundColor: Color(0xffeaeaea),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.add_shopping_cart,
                    size: 26.0,
                    color: Color(0xff636363),
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Icon(
                    Icons.login_rounded,
                    color: Color(0xff636363),
                  ),
                )),
          ],
        ),
        body:

            //items.length==0 ? Center(child: Text("No Data Available")):
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('advance-booking-product')
                    .snapshots()
                    .map((event) => event.docs
                        .map((e) => ProductDataModel(
                            date: e['date'],
                            des: e['description'],
                            name: e['name'],
                            price: e['price']))
                        .toList()),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    // print('snapshot1: ' + snapshot.error.toString());
                    print("Errorrr");
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData){
                  return ListView.builder(
                      padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        ProductDataModel productData =
                        snapshot.data[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SuperBasmati()));
                          },
                          child: Card(
                            child: ListTile(
                              //leading:
                              //  Image.network(items[index].imageURL.toString()),
                              title: Text(productData.name),
                              subtitle:
                                  Text("The Date is ${productData.date}"),
                              trailing: Text(
                                "Rs. ${productData.price}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        );
                      });
                  }
                  else {
                    print("mistake...");
                    return Center(child: CircularProgressIndicator());
                  }
                }));
  }
}

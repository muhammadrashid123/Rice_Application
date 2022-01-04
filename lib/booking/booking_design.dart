import 'dart:convert';
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
  List<ProductDataModel> items=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DatabaseReference referenceData = FirebaseDatabase.instance.reference().child("advance-booking-product");
    referenceData.once().then((DataSnapshot dataSnapShot){
      items.clear();
      var keys = dataSnapShot.value.keys;
      var values = dataSnapShot.value;

      for(var key in keys) {
        ProductDataModel data = new ProductDataModel(
            values [key]["coming_date"],
            values [key]["description"],
            values [key]["image"],
            values [key]["price"],
            values [key]["name"]);
        items.add(data);
      }
      setState(() {
        //
      });
    });

  }
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
          items.length==0 ? Center(child: Text("No Data Available")):
            ListView.builder(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                itemCount: items == null ? 0 : items.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SuperBasmati()));
                    },
                    child: Card(
                      child: ListTile(
                        leading:
                            Image.network(items[index].imageURL.toString()),
                        title: Text(items[index].name.toString()),
                        subtitle: Text(
                            "The Date is ${items[index].date.toString()}"),
                        trailing: Text(
                          "Rs. ${items[index].price.toString()}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  );
                })

    );
  }
}


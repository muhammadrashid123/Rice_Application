import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rice/booking/booking_design.dart';
import 'package:rice/models/product_model.dart';
import 'package:rice/screens/home_page.dart';
import 'package:rice/screens/login.dart';
import 'package:rice/widgets/bottom_navigation_bar.dart';
import 'details_page.dart';

class TypeRice extends StatefulWidget {
  @override
  _TypeRiceState createState() => _TypeRiceState();
}

class _TypeRiceState extends State<TypeRice> {
  var _pageData = [HomePage(), MyHomePage()];
  int _selectedItem = 0;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Type of Rice",
          style: TextStyle(
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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Product_type')
              .snapshots()
              .map((event) => event.docs
              .map((e) => ProductModel(
              des: e['description'],
              name: e['name'],
              price: e['price'],
              quantity: e['quantity']))
              .toList()),
          builder: (context, snapshot) {
    if (snapshot.hasError) {
    // print('snapshot1: ' + snapshot.error.toString());
    return Center(
    child: Text(snapshot.error.toString()),
    );
    } else if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  ProductModel productData = snapshot.data[index];
                  return Card(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SuperBasmati()));
                        },
                        child: ListTile(
                          title: Text(productData.name),
                          subtitle: Text(productData.des),
                          //leading: Image.network(
                          //  "https://www.jessicagavin.com/wp-content/uploads/2020/03/types-of-rice-arborio-600x400.jpg"),
                          trailing: Text(
                            productData.price,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                                fontSize: 18),
                          ),
                        ),
                      ));
                }

            );
    } else {
      return Center(child: CircularProgressIndicator());
    }
          }
        ),
      ),
    );
  }
}
// Card(
// child: InkWell(
// onTap: () {
// Navigator.push(context,
// MaterialPageRoute(builder: (context) => SuperBasmati()));
// },
// child: ListTile(
// title: Text(" Long-Grain Rice"),
// subtitle: Text("Pakistani Arborio rice"),
// leading: Image.network(
// "https://www.jessicagavin.com/wp-content/uploads/2020/03/types-of-rice-arborio-600x400.jpg"),
// trailing: Text(
// "Rs. 190",
// style: TextStyle(
// fontWeight: FontWeight.bold,
// color: Colors.green,
// fontSize: 18),
// ),
// ),
// )),
// Card(
// child: InkWell(
// onTap: () {
// Navigator.push(context,
// MaterialPageRoute(builder: (context) => SuperBasmati()));
// },
// child: ListTile(
// title: Text(" Medium-grain Rice"),
// subtitle: Text("Pakistani Arborio rice"),
// leading: Image.network(
// "https://www.jessicagavin.com/wp-content/uploads/2020/03/types-of-rice-arborio-600x400.jpg"),
// trailing: Text(
// "Rs. 170",
// style: TextStyle(
// fontWeight: FontWeight.bold,
// color: Colors.green,
// fontSize: 18),
// ),
// ),
// )),
// Card(
// child: InkWell(
// onTap: () {
// Navigator.push(context,
// MaterialPageRoute(builder: (context) => SuperBasmati()));
// },
// child: ListTile(
// title: Text(" Small-grain Rice"),
// subtitle: Text("Pakistani Arborio rice"),
// leading: Image.network(
// "https://www.jessicagavin.com/wp-content/uploads/2020/03/types-of-rice-arborio-600x400.jpg"),
// trailing: Text(
// "Rs. 120",
// style: TextStyle(
// fontWeight: FontWeight.bold,
// color: Colors.green,
// fontSize: 18),
// ),
// ),
// )),
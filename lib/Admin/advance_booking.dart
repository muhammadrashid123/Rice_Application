import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rice/booking/booking_design.dart';
import 'package:rice/booking/booking_model.dart';
import 'package:rice/models/book_in_advance.dart';
import 'package:rice/models/category_model.dart';
import 'package:rice/screens/details_page.dart';
import 'package:rice/screens/home_page.dart';
import 'package:rice/screens/login.dart';
import 'package:rice/widgets/bottom_navigation_bar.dart';

import 'admin_product_page.dart';

class AdvanceBooking extends StatefulWidget {
  @override
  _AdvanceBookingState createState() => _AdvanceBookingState();
}

class _AdvanceBookingState extends State<AdvanceBooking> {
  final fb = FirebaseDatabase.instance;
  // var retrievedName="";

  // editing controller
  //final TextEditingController category = new TextEditingController();
  final nameController = new TextEditingController();
  final descriptionEditingController = new TextEditingController();
  final dateController = new TextEditingController();
  final priceController = new TextEditingController();
  //final TextEditingController passwordController = new TextEditingController();

  // firebase
  //final _auth = FirebaseAuth.instance;
  // string for displaying the error Message
  //String errorMessage;
  var _pageData = [HomePage(), MyHomePage()];
  int _selectedItem = 0;
  final _formKey = GlobalKey<FormState>();
  @override
  @override

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xff636363)),
        elevation: 0,
        title: Text(
          "Add Advance Booking",
          style: TextStyle(
            color: Color(0xff636363),
            fontSize: 22,
          ),
        ),
        backgroundColor: Color(0xffeaeaea),
        actions: <Widget>[
          // Padding(
          //     padding: EdgeInsets.only(right: 20.0),
          //     child: GestureDetector(
          //       onTap: () {},
          //       child: Icon(
          //         Icons.add,
          //         size: 26.0,
          //         color: Color(0xff636363),
          //       ),
          //     )),
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
                .collection('advance-booking-product')
                .snapshots()
                .map((event) => event.docs
                .map((e) => AdvanceBookingModel(
              date: e.data()['date'],
              des: e.data()['description'],
              name: e.data()['name'],
              price: e.data()['price'],
            ))
                .toList()),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                // print('snapshot1: ' + snapshot.error.toString());
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }else if (snapshot.hasData){
                return ListView.builder(
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (BuildContext context,int index){
                      AdvanceBookingModel advanceBookingModel =
                      snapshot.data[index];
                      return Card(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => SuperBasmati()));
                            },
                            child: ListTile(
                              //leading:
                              //  Image.network(items[index].imageURL.toString()),
                              title: Text(advanceBookingModel.name),
                              subtitle:
                              Text("The Date is ${advanceBookingModel.date}"),
                              trailing: Text(
                                "Rs. ${advanceBookingModel.price}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                    fontSize: 18),
                              ),
                            ),
                          ));}
                );
              }else {
                return Center(child: CircularProgressIndicator());
              }
            }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => _buildPopupDialog(context),
          );
        },
        // label: const Text('Add Products'),
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
  Widget _buildPopupDialog(BuildContext context) {
    //final ref = fb.reference().child("Product-Category");
    File pickedImage;
    return new AlertDialog(
      title: const Text('Add Advance Booking'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.stretch,
          //   children: [
          //     const SizedBox(
          //       height: 10,
          //     ),
          //     Align(
          //       alignment: Alignment.center,
          //       child: Stack(
          //         children: [
          //           Container(
          //             padding: EdgeInsets.all(8),
          //             decoration: BoxDecoration(
          //               border: Border.all(color: Colors.green, width: 3),
          //               borderRadius: const BorderRadius.all(
          //                 Radius.circular(100),
          //               ),
          //             ),
          //             child: ClipOval(
          //                 child: pickedImage != null
          //                     ? Image.file(
          //                         pickedImage,
          //                         width: 170,
          //                         height: 170,
          //                         fit: BoxFit.cover,
          //                       )
          //                     : Icon(
          //                         Icons.camera_alt,
          //                         color: Colors.green,
          //                         size: 100,
          //                       )),
          //           ),
          //           // Positioned(
          //           //   bottom: 0,
          //           //   right: 7,
          //           //   child: IconButton(
          //           //     onPressed: () {},
          //           //     icon: const Icon(
          //           //       Icons.add_a_photo_outlined,
          //           //       color: Colors.blue,
          //           //       size: 30,
          //           //     ),
          //           //   ),
          //           // )
          //         ],
          //       ),
          //     ),
          //     const SizedBox(
          //       height: 10,
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: ElevatedButton.icon(
          //           onPressed: () {},
          //           icon: const Icon(Icons.add_a_photo_sharp),
          //           label: const Text('UPLOAD IMAGE')),
          //     )
          //   ],
          // ),
          Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.stretch,
                      //   children: [
                      //     const SizedBox(
                      //       height: 10,
                      //     ),
                      //     Align(
                      //       alignment: Alignment.center,
                      //       child: Stack(
                      //         children: [
                      //           // Container(
                      //           //   padding: EdgeInsets.all(8),
                      //           //   decoration: BoxDecoration(
                      //           //     border: Border.all(color: Colors.green, width: 3),
                      //           //     borderRadius: const BorderRadius.all(
                      //           //       Radius.circular(100),
                      //           //     ),
                      //           //   ),
                      //           //   child: ClipOval(
                      //           //       child: pickedImage != null
                      //           //           ? Image.file(
                      //           //               pickedImage,
                      //           //               width: 170,
                      //           //               height: 170,
                      //           //               fit: BoxFit.cover,
                      //           //             )
                      //           //           : Icon(
                      //           //               Icons.camera_alt,
                      //           //               color: Colors.green,
                      //           //               size: 100,
                      //           //             )),
                      //           // ),
                      //           // Positioned(
                      //           //   bottom: 0,
                      //           //   right: 7,
                      //           //   child: IconButton(
                      //           //     onPressed: () {},
                      //           //     icon: const Icon(
                      //           //       Icons.add_a_photo_outlined,
                      //           //       color: Colors.blue,
                      //           //       size: 30,
                      //           //     ),
                      //           //   ),
                      //           // )
                      //         ],
                      //       ),
                      //     ),
                      //     // const SizedBox(
                      //     //   height: 10,
                      //     // ),
                      //     // Padding(
                      //     //   padding: const EdgeInsets.all(8.0),
                      //     //   child: ElevatedButton.icon(
                      //     //       onPressed: () {},
                      //     //       icon: const Icon(Icons.add_a_photo_sharp),
                      //     //       label: const Text('UPLOAD IMAGE')),
                      //     // )
                      //   ],
                      // ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(hintText: "Enter Product Name"),
                          controller: nameController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return ("Please Enter Product Name");
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: descriptionEditingController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return ("Please Enter Description");
                            }
                          },
                          decoration: InputDecoration(hintText: "Enter Description"),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: dateController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return ("Please Enter Date");
                            }
                          },
                          decoration: InputDecoration(hintText: "Enter Date"),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: priceController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return ("Please Enter Price");
                            }
                          },
                          decoration: InputDecoration(hintText: "Enter Price"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          child: Text("Submit"),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              FirebaseFirestore.instance
                                  .collection('Product_type')
                                  .add({
                                'date': dateController.text,
                                'description': descriptionEditingController.text,
                                'name': nameController.text,
                                'price': priceController.text
                              });
                              Fluttertoast.showToast(msg: "Product added Successful");
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Close'),
        ),
      ],
    );
  }


}

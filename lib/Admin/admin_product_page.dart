import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rice/Services/Firestore/add_product_firestore.dart';
import 'package:rice/booking/booking_design.dart';
import 'package:rice/models/product_model.dart';
import 'package:rice/screens/details_page.dart';
import 'package:rice/screens/home_page.dart';
import 'package:rice/screens/login.dart';

class AdminAddProduct extends StatefulWidget {
  @override
  _AdminAddProductState createState() => _AdminAddProductState();
}

class _AdminAddProductState extends State<AdminAddProduct> {
  //final fb = FirebaseDatabase.instance;
  var _pageData = [HomePage(), MyHomePage()];
  int _selectedItem = 0;
  final _formKey = GlobalKey<FormState>();
  File _image;
  Future getImage() async {
    final File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image.path);
    });
  }
  
  final productNameController = new TextEditingController();
  final descriptionEditingController = new TextEditingController();
  final quantityController = new TextEditingController();
  final priceController = new TextEditingController();
  //final confirmPasswordEditingController = new TextEditingController();
 
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xff636363)),
        elevation: 0,
        title: Text(
          "Add Products",
          style: TextStyle(
            color: Color(0xff636363),
            fontSize: 22,
          ),
        ),
        backgroundColor: Color(0xffeaeaea),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Product-Category').doc('8jcp8EHqiLlJohvhpIz6').collection('product')
                .snapshots()
                .map((event) => event.docs
                    .map((e) => ProductModel(
                        des: e.data()['description'],
                        image: e.data()['image'],
                        name: e.data()['name'],
                        price: e.data()['price'],
                        quantity: e.data()['quantity']))
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
                          leading: Image.network(productData.image),
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
                    });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
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
    var pickedImage;
    final s = MediaQuery.of(context).size;
    return new AlertDialog(
      title: const Text('Add Products'),
      content: SingleChildScrollView(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  GestureDetector(
                      onTap: getImage,
                      child: Container(
                        //margin: EdgeInsets.symmetric(horizontal: 10),
                          width: s.width,
                          child: SizedBox(
                              height: 200,
                              width: s.width,
                              child: _image == null
                                  ? Image.asset(
                                "assets/upload.PNG",
                                fit: BoxFit.cover,
                              )
                                  : Image.file(_image)))),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(hintText: "Enter Product Name"),
                      controller: productNameController,
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
                      controller: quantityController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return ("Please Enter Quantity");
                        }
                      },
                      decoration: InputDecoration(hintText: "Enter Quantity"),
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
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          if(_image!=null){
                            Navigator.pop(context);
                            await AddProductFirestore.createAddProduct(
                                des: descriptionEditingController.text,
                                // activities: _selectedActivities,
                                image: _image,
                                name: productNameController.text,
                                price: priceController.text,
                                quantity: quantityController.text

                            );
                          }else{
                            Fluttertoast.showToast(msg: 'Image is required');
                          }
                          // FirebaseFirestore.instance
                          //     .collection('Product_type')
                          //     .add({
                          //   'description': descriptionEditingController.text,
                          //   'name': productNameController.text,
                          //   'price': priceController.text,
                          //   'quantity': quantityController.text
                          // });
                          // Fluttertoast.showToast(msg: "Product added Successful");
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

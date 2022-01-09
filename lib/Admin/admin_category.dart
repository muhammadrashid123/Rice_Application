import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rice/Services/Firestore/category_firestore.dart';
import 'package:rice/booking/booking_design.dart';
import 'package:rice/models/category_model.dart';
import 'package:rice/screens/details_page.dart';
import 'package:rice/screens/home_page.dart';
import 'package:rice/screens/login.dart';
import 'package:rice/widgets/bottom_navigation_bar.dart';

import 'admin_product_page.dart';

class AdminCategory extends StatefulWidget {
  @override
  _AdminCategoryState createState() => _AdminCategoryState();
}

class _AdminCategoryState extends State<AdminCategory> {
  final fb = FirebaseDatabase.instance;
  // var retrievedName="";

  // editing controller
  final TextEditingController category = new TextEditingController();
  //final TextEditingController passwordController = new TextEditingController();

  // firebase
  //final _auth = FirebaseAuth.instance;
  // string for displaying the error Message
  //String errorMessage;
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

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xff636363)),
        elevation: 0,
        title: Text(
          "Add Category",
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
                .collection('Product-Category')
                .snapshots()
                .map((event) => event.docs
                    .map((e) => CateModel(
                          title: e.data()['title'],
                          image: e.data()['image'],

                        ))
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
                      CateModel cateData = snapshot.data[index];
                      return Card(
                          child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdminAddProduct()));
                        },
                        child: ListTile(
                          title: Text(cateData.title),
                          leading: Image.network(cateData.image),
                          // subtitle: Text("Pakistani Arborio rice"),
                          // leading: Image.network(
                          //     "https://www.jessicagavin.com/wp-content/uploads/2020/03/types-of-rice-arborio-600x400.jpg"),
                          // trailing: Text(
                          //   "Rs. 190",
                          //   style: TextStyle(
                          //       fontWeight: FontWeight.bold,
                          //       color: Colors.green,
                          //       fontSize: 18),
                          // ),
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
    //final ref = fb.reference().child("Product-Category");
    File pickedImage;
    final s = MediaQuery.of(context).size;
    return new AlertDialog(
      title: const Text('Add Category'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: [
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
                              : Image.file(_image))))
            ],
          ),
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
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: category,
                    validator: (value) {
                      if (value.isEmpty) {
                        return ("Please Enter Category Name");
                      }
                    },
                    decoration:
                        InputDecoration(hintText: "Enter Category Name"),
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
                          await CategoryFirestore.createCategory(
                            title: category.text,
                            // activities: _selectedActivities,
                            image: _image,
                          );
                         }else{
                          Fluttertoast.showToast(msg: 'Image is required');
                        }
                        // FirebaseFirestore.instance
                        //     .collection('Product-Category')
                        //     .add({'title': category.text});
                        // Fluttertoast.showToast(
                        //     msg: "Category added Successful");

                        // ref.child("title").once().then(( DataSnapshot data){
                        //   setState(() {
                        //     retrievedName =data.value;
                        //   });
                        // });

                      }
                    },
                  ),
                )
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

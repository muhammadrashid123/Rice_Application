import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rice/booking/booking_design.dart';
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
        child: ListView(
          children: [
            Card(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AdminAddProduct()));
                  },
                  child: ListTile(
                    title: Text(" Long-Grain Rice"),
                    subtitle: Text("Pakistani Arborio rice"),
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
                )),
          ],
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
    return new AlertDialog(
      title: const Text('Add Category'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration:
                    InputDecoration(hintText: "Enter Category Name"),
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.all(8.0),
                //   child: TextFormField(
                //     decoration: InputDecoration(hintText: "Slogen Line"),
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Enter Description"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    child: Text("Submit"),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
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

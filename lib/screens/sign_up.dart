import 'package:flutter/material.dart';
import 'package:rice/screens/home_page.dart';
import 'package:rice/widgets/set.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(30),
          height: 150,
          width: double.infinity,
          child: Text(
            "Create new Account",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
          ),
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(150))),
        ),
        Container(
          margin: EdgeInsets.only(top: 200),
          child: Center(
            child: Column(
              children: [
                Form(
                    key: _formkey,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 210,
                                  // Email wala Container
                                  // margin: EdgeInsets.symmetric(
                                  //     horizontal: 40, vertical: 10),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2, color: maingreycolor),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "Enter Name";
                                            }
                                            return null;
                                          },
                                          style:
                                              TextStyle(color: maingreycolor),
                                          decoration: InputDecoration(
                                              hintStyle: TextStyle(
                                                  color: maingreycolor),
                                              hintText: "First Name",
                                              border: InputBorder.none),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 210,
                                  // Email wala Container
                                  // margin: EdgeInsets.symmetric(
                                  //     horizontal: 10, vertical: 0),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2, color: maingreycolor),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "Enter Name";
                                            }
                                            return null;
                                          },
                                          style:
                                              TextStyle(color: maingreycolor),
                                          decoration: InputDecoration(
                                              hintStyle: TextStyle(
                                                  color: maingreycolor),
                                              hintText: "Last Name",
                                              border: InputBorder.none),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            // Email wala Container
                            // margin: EdgeInsets.symmetric(
                            //     horizontal: 40, vertical: 10),
                            // padding: EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2, color: maingreycolor),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  //Container for Icon
                                  child: Icon(Icons.person,
                                      size: 30, color: maingreycolor),
                                  padding: EdgeInsets.fromLTRB(12, 2, 12, 5),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please enter Email";
                                      }
                                      return null;
                                    },
                                    style: TextStyle(color: maingreycolor),
                                    decoration: InputDecoration(
                                        hintStyle:
                                            TextStyle(color: maingreycolor),
                                        hintText: "Enter Email",
                                        border: InputBorder.none),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            // Email wala Container
                            // margin: EdgeInsets.symmetric(
                            //     horizontal: 40, vertical: 10),
                            // padding: EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2, color: maingreycolor),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  //Container for Icon
                                  child: Icon(
                                    Icons.lock,
                                    size: 30,
                                    color: maingreycolor,
                                  ),
                                  padding: EdgeInsets.fromLTRB(12, 2, 12, 5),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    obscureText: true,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please enter Password";
                                      }
                                      return null;
                                    },
                                    style: TextStyle(color: maingreycolor),
                                    decoration: InputDecoration(
                                        hintStyle:
                                            TextStyle(color: maingreycolor),
                                        hintText: "Password",
                                        border: InputBorder.none),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            // Email wala Container
                            // margin: EdgeInsets.symmetric(
                            //     horizontal: 40, vertical: 10),
                            // padding: EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2, color: maingreycolor),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  //Container for Icon
                                  child: Icon(
                                    Icons.lock,
                                    size: 30,
                                    color: maingreycolor,
                                  ),
                                  padding: EdgeInsets.fromLTRB(12, 2, 12, 5),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    obscureText: true,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please enter Password";
                                      }
                                      return null;
                                    },
                                    style: TextStyle(color: maingreycolor),
                                    decoration: InputDecoration(
                                        hintStyle:
                                            TextStyle(color: maingreycolor),
                                        hintText: "Confirm Password",
                                        border: InputBorder.none),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Material(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(15),
                            child: InkWell(
                                onTap: () {
                                  if (_formkey.currentState.validate()) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomePage()));
                                  }
                                },
                                child: new Container(
                                  height: 50,
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Create Account",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ), //form
      ],
    ));
  }
}

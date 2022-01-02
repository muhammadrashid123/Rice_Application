import 'package:flutter/material.dart';
import 'package:rice/Admin/admin_home.dart';
import 'package:rice/screens/home_page.dart';
import 'package:rice/screens/sign_up.dart';
import 'package:rice/widgets/set.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/gestures.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 200),
          child: Center(
            child: Column(
              children: [
                Text(
                  "Login",
                  style: TextStyle(
                      color: maingreycolor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Form(
                    key: _formkey,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Column(
                        children: [
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
                          SizedBox(
                            height: 15,
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
                                            builder: (context) => AdminHome()));
                                  }
                                },
                                child: new Container(
                                  height: 50,
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                )),
                          ),
       // Forget-Password part which on clicking take user to forget-password screen
                          Container(
                            padding: const EdgeInsets.only(top: 5) ,
                            alignment: Alignment.bottomRight,
                              child: RichText(
                                   text: TextSpan(
                                        text: 'Forget Password',
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () => Navigator.push(context,
                                                          MaterialPageRoute(builder: (context) => ForgetPasswordScreen())),
                                        style: TextStyle(
                                          color: Colors.blue,
                                          decoration: TextDecoration.underline,
                                          fontSize: 15,
                                        )),
                                ),
                              )
                        ],
                      ),
                    )),
                SizedBox(
                  height: 150,
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                      Fluttertoast.showToast(
                        msg: "This page is unavailable",
                      );
                    },
                    child: Text("Create New Account"))
              ],
            ),
          ),
        ), //form
      ],
    ));
  }
}

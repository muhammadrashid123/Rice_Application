import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rice/Admin/admin_home.dart';
import 'package:rice/screens/home_page.dart';
import 'package:rice/screens/sign_up.dart';
import 'package:rice/widgets/set.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/gestures.dart';

import 'forget_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  // firebase
  final _auth = FirebaseAuth.instance;
  // string for displaying the error Message
  String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 200),
          child: Center(
            child: Form(
              key: _formKey,
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
                  Padding(
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
                                  controller: emailController ,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter Email";
                                    }
                                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                        .hasMatch(value)) {
                                      return ("Please Enter a valid email");
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
                                  controller: passwordController,
                                  obscureText: true,
                                  validator: (value) {
                                    // if (value == null || value.isEmpty) {
                                    //   return "Please enter Password";
                                    // }
                                    // return null;
                                    RegExp regex = new RegExp(r'^.{6,}$');
                                    if (value.isEmpty) {
                                      return ("Password is required for login");
                                    }
                                    if (!regex.hasMatch(value)) {
                                      return ("Enter Valid Password(Min. 6 Character)");
                                    }
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
                                // if (_formkey.currentState.validate()) {
                                //   Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //           builder: (context) => AdminHome()));
                                 signIn(emailController.text,passwordController.text );

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
                          padding: const EdgeInsets.only(top: 5),
                          alignment: Alignment.bottomRight,
                          child: RichText(
                            text: TextSpan(
                                text: 'Forget Password',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ForgetPasswordScreen())),
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15,
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
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
          ),
        ), //form
      ],
    ));
  }
  void signIn(String email, String password) async {
    if (_formKey.currentState.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
          Fluttertoast.showToast(msg: "Login Successful"),
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => AdminHome())),
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage);
        print(error.code);
      }
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rice/models/user_model.dart';
import 'package:rice/screens/home_page.dart';
import 'package:rice/widgets/set.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String errorMessage;

  // our form key
  final _formKey = GlobalKey<FormState>();
  // editing Controller
  final firstNameEditingController = new TextEditingController();
  final secondNameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final S =MediaQuery.of(context).size;
    return Scaffold(

        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Stack(
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
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Column(
                        children: [
                          Container(
                            //margin: EdgeInsets.symmetric(horizontal: 10),
                            width: S.width,
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
                            child: TextFormField(

                              validator: (value) {
                                // if (value == null || value.isEmpty) {
                                //   return "Enter Name";
                                // }
                                // return null;
                                RegExp regex =
                                    new RegExp(r'^.{3,}$');
                                if (value.isEmpty) {
                                  return ("First Name cannot be Empty");
                                }
                                if (!regex.hasMatch(value)) {
                                  return ("Enter Valid name(Min. 3 Character)");
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
                              controller: firstNameEditingController,
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            width: S.width,
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
                            child: Flexible(

                              child: TextFormField(
                                validator: (value) {
                                  // if (value == null || value.isEmpty) {
                                  //   return "Enter Name";
                                  // }
                                  // return null;
                                  if (value.isEmpty) {
                                    return ("Last Name cannot be Empty");
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
                                controller: secondNameEditingController,
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            // Email wala Container
                            // margin: EdgeInsets.symmetric(
                            //     horizontal: 40, vertical: 10),
                            // padding: EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                            decoration: BoxDecoration(
                              border: Border.all(width: 2, color: maingreycolor),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  //Container for Icon
                                  child: Icon(Icons.email,
                                      size: 30, color: maingreycolor),
                                  padding: EdgeInsets.fromLTRB(12, 2, 12, 5),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    validator: (value) {
                                      //   if (value == null || value.isEmpty) {
                                      //     return "Please enter Email";
                                      //   }
                                      //   return null;
                                      if (value.isEmpty) {
                                        return ("Please Enter Your Email");
                                      }
                                      // reg expression for email validation
                                      if (!RegExp(
                                              "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
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
                                      controller: emailEditingController,
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
                              border: Border.all(width: 2, color: maingreycolor),
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
                                    controller: passwordEditingController,
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
                              border: Border.all(width: 2, color: maingreycolor),
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
                                      // if (value == null || value.isEmpty) {
                                      //   return "Please enter Password";
                                      // }
                                      // return null;
                                      if (confirmPasswordEditingController.text !=
                                          passwordEditingController.text) {
                                        return "Password don't match";
                                      }
                                      return null;
                                    },
                                    style: TextStyle(color: maingreycolor),
                                    decoration: InputDecoration(
                                        hintStyle:
                                            TextStyle(color: maingreycolor),
                                        hintText: "Confirm Password",
                                        border: InputBorder.none),
                                    controller: confirmPasswordEditingController,
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
                                  // if (_formkey.currentState.validate()) {
                                  //   Navigator.push(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //           builder: (context) => HomePage()));
                                  // }
                                  signUp(emailEditingController.text, passwordEditingController.text);
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
                    ),
                  ),
                ), //form
      ],
    ),
              ],
            ),
          ),
        ));
  }
  void signUp(String email, String password) async {
    if (_formKey.currentState.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e.message);
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
  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEditingController.text;
    userModel.lastName = secondNameEditingController.text;
    userModel.password= passwordEditingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => HomePage()),
            (route) => false);
  }
}

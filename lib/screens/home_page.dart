import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rice/booking/booking_design.dart';
import 'package:rice/screens/login.dart';
import 'package:rice/screens/rice_type.dart';
import 'details_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _pageData = [HomePage(), MyHomePage()];
  int _selectedItem = 0;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "RICE WORLD",
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Rice Category",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 700,
                width: double.infinity,
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TypeRice()));
                      },
                      child: Card(
                        child: Column(
                          children: [
                            Image.network(
                                "https://www.jessicagavin.com/wp-content/uploads/2020/03/types-of-rice-arborio-600x400.jpg"),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Arborio Rice",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TypeRice()));
                      },
                      child: Card(
                        child: Column(
                          children: [
                            Image.network(
                                "https://www.jessicagavin.com/wp-content/uploads/2020/03/types-of-rice-basmati-600x400.jpg"),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Basmati Rice",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TypeRice()));
                      },
                      child: Card(
                        child: Column(
                          children: [
                            Image.network(
                                "https://www.jessicagavin.com/wp-content/uploads/2020/03/types-of-rice-black-600x400.jpg"),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Black Rice",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TypeRice()));
                      },
                      child: Card(
                        child: Column(
                          children: [
                            Image.network(
                                "https://www.jessicagavin.com/wp-content/uploads/2020/03/types-of-rice-jasmine-600x400.jpg"),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Jasmine Rice",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TypeRice()));
                      },
                      child: Card(
                        child: Column(
                          children: [
                            Image.network(
                                "https://www.jessicagavin.com/wp-content/uploads/2020/03/types-of-rice-brown-600x400.jpg"),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Brown Rice",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TypeRice()));
                      },
                      child: Card(
                        child: Column(
                          children: [
                            Image.network(
                                "https://www.jessicagavin.com/wp-content/uploads/2020/03/types-of-rice-red-600x400.jpg"),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Red cargo Rice",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TypeRice()));
                      },
                      child: Card(
                        child: Column(
                          children: [
                            Image.network(
                                "https://www.jessicagavin.com/wp-content/uploads/2020/03/types-of-rice-parboiled-600x400.jpg"),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Parboiled Rice",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TypeRice()));
                      },
                      child: Card(
                        child: Column(
                          children: [
                            Image.network(
                                "https://www.jessicagavin.com/wp-content/uploads/2020/03/types-of-rice-sticky-sweet-600x400.jpg"),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Sticky Rice",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

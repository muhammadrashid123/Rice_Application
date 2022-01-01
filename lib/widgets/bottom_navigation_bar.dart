import 'package:flutter/material.dart';
import 'package:rice/booking/booking_design.dart';
import 'package:rice/screens/home_page.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({key}) : super(key: key);

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  var _pageData = [HomePage(), MyHomePage()];
  int _selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pageData[_selectedItem],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.attach_money), label: "Booking"),
        ],
        currentIndex: _selectedItem,
        onTap: (value) {
          setState(() {
            _selectedItem = value;
          });
        },
      ),
    );
  }
}

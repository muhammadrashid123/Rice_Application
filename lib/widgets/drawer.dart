import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rice/Admin/admin_category.dart';
import 'package:rice/Admin/admin_home.dart';
import 'package:rice/screens/rice_type.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    final pic =
        "https://yt3.ggpht.com/ytc/AKedOLT0Wm5jyAwRmethQ9QHGCtvNeWhGhBhEdyVh-aTaQ=s900-c-k-c0x00ffffff-no-rj";
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                accountName: Text("Admin View"),
                accountEmail: Text("www.Rice.com.pk"),
                currentAccountPicture: CircleAvatar(
                  child: Text(
                    "R",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  // backgroundImage: NetworkImage(pic),
                ),
              )),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AdminHome()));
            },
            child: ListTile(
              leading: Icon(Icons.home),
              title: Text("Dashboard"),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AdminHome()));
            },
            child: ListTile(
              leading: Icon(Icons.add),
              title: Text("Add Products"),
              onTap: () {
                // showDialog(
                //   context: context,
                //   builder: (BuildContext context) => _buildPopupDialog(context),
                // );
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdminCategory()));
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.add_box_rounded),
            title: Text("Advance Booking"),
          ),
          Divider(height: 2),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile"),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
          ),
        ],
      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('Add Products'),
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
                    decoration: InputDecoration(hintText: "Name"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Slogen Line"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Detail"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    child: Text("Add to Dashboard"),
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

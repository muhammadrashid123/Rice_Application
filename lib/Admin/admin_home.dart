import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rice/booking/booking_design.dart';
import 'package:rice/screens/login.dart';
import 'package:rice/screens/rice_type.dart';
import 'package:rice/widgets/drawer.dart';

class AdminHome extends StatefulWidget {
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  var _pageData = [AdminHome(), MyHomePage()];
  int _selectedItem = 0;
  final _formKey = GlobalKey<FormState>();
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
        iconTheme: IconThemeData(
          color: Color(0xff636363),
        ),
        backgroundColor: Color(0xffeaeaea),
        actions: <Widget>[
          // Padding(
          //     padding: EdgeInsets.only(right: 20.0),
          //     child: GestureDetector(
          //       onTap: () {},
          //       child: Icon(
          //         Icons.add_shopping_cart,
          //         size: 26.0,
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
                "Dashboard",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              GridView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                primary: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                  childAspectRatio: 6/7,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TypeRice()));
                    },
                    child: Card(
                      child: Column(
                        children: [
                          Image.asset("assets/rain.jpg"),
                          // Image.network(
                          //     "https://www.istockphoto.com/photo/transparent-umbrella-under-rain-against-water-drops-splash-background-rainy-weather-gm1257951336-368822698?utm_source=unsplash&utm_medium=affiliate&utm_campaign=srp_photos_top&utm_content=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Frain&utm_term=rain%3A%3A%3A"),
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
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      drawer: MyDrawer(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     showDialog(
      //       context: context,
      //       builder: (BuildContext context) => _buildPopupDialog(context),
      //     );
      //   },
      //   // label: const Text('Add Products'),
      //   child: Icon(Icons.add),
      //   backgroundColor: Colors.green,
      // ),
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

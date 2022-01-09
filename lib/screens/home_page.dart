import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rice/booking/booking_design.dart';
import 'package:rice/models/category_model.dart';
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

                  // GridView.builder(
                  //   itemCount: 6,
                  //   gridDelegate: ,
                  //   crossAxisCount: 2,
                  //   crossAxisSpacing: 15,
                  //   mainAxisSpacing: 15,
                  //     InkWell(
                  //       onTap: () {
                  //         Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) => TypeRice()));
                  //       },
                  //       child: Card(
                  //         child: Column(
                  //           children: [
                  //             Image.asset("assets/rain.jpg"),
                  //             // Image.network(
                  //             //     "https://www.istockphoto.com/photo/transparent-umbrella-under-rain-against-water-drops-splash-background-rainy-weather-gm1257951336-368822698?utm_source=unsplash&utm_medium=affiliate&utm_campaign=srp_photos_top&utm_content=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Frain&utm_term=rain%3A%3A%3A"),
                  //             SizedBox(
                  //               height: 15,
                  //             ),
                  //             Text(
                  //               "Arborio Rice",
                  //               style: TextStyle(
                  //                   color: Colors.green,
                  //                   fontWeight: FontWeight.bold,
                  //                   fontSize: 18),
                  //             )
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  // ),

              // child: StreamBuilder(
              //     stream: FirebaseFirestore.instance
              //         .collection('Product-Category')
              //         .snapshots()
              //         .map((event) => event.docs
              //         .map((e) => CateModel(
              //       title: e['title'],
              //     ))
              //         .toList()),
              //     builder: (context, snapshot) {
              //       if (snapshot.hasError) {
              //         // print('snapshot1: ' + snapshot.error.toString());
              //         return Center(
              //           child: Text(snapshot.error.toString()),
              //         );
              //       }else if (snapshot.hasData){
              //         return ListView.builder(
              //             itemCount: snapshot.data?.length ?? 0,
              //             itemBuilder: (BuildContext context,int index){
              //               CateModel cateData =
              //               snapshot.data[index];
              //               return Card(
              //                   child: InkWell(
              //                     onTap: () {
              //                       Navigator.push(context,
              //                           MaterialPageRoute(builder: (context) => TypeRice()));
              //                     },
              //                     child: ListTile(
              //
              //                       title: Text(cateData.title),
              //                       // subtitle: Text("Pakistani Arborio rice"),
              //                       // leading: Image.network(
              //                       //     "https://www.jessicagavin.com/wp-content/uploads/2020/03/types-of-rice-arborio-600x400.jpg"),
              //                       // trailing: Text(
              //                       //   "Rs. 190",
              //                       //   style: TextStyle(
              //                       //       fontWeight: FontWeight.bold,
              //                       //       color: Colors.green,
              //                       //       fontSize: 18),
              //                       // ),
              //                     ),
              //                   ));}
              //         );
              //       }else {
              //         return Center(child: CircularProgressIndicator());
              //       }
              //     }
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

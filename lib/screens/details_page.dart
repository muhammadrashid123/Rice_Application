import 'package:flutter/material.dart';
import 'package:rice/widgets/set.dart';

class SuperBasmati extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xff636363),
        ),
        elevation: 0,
        title: Text(
          "Rice Detail",
          style: TextStyle(
            color: Color(0xff636363),
            fontSize: 22,
          ),
        ),
        backgroundColor: Color(0xffeaeaea),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                radius: 150.0,
                backgroundImage: NetworkImage(
                  "http://asiaglobalcommodities.com/upload/Super_Kernel_Basmati_White_Rice_Full_Of_Aroma_AGL_7.2mm1.jpg",
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Super Basmati",
              style: mainHeading,
            ),
            Text(
              "Pakistan Super Kernel Basmati White Rice",
              style: productDetail,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              height: 70,
              width: double.infinity,
              color: Colors.green,
              child: Text("Rs. 160/- Per KG", style: pricedetail),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "There are various sizes available for buying a rice bag online. There are food brands that offer high-quality 1KG rice bag sizes with a variety of premium grains for cooking speciality biryani and pulao at home. The economical rice bag size is larger and used for everyday home cooking for the whole family.",
              style: disRice,
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: const Icon(Icons.add),
      //   backgroundColor: Colors.green,
      // ),
    );
  }
}

class BrownRice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xff636363),
        ),
        elevation: 0,
        title: Text(
          "Rice Detail",
          style: TextStyle(
            color: Color(0xff636363),
            fontSize: 22,
          ),
        ),
        backgroundColor: Color(0xffeaeaea),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                radius: 150.0,
                backgroundImage: NetworkImage(
                  "https://pakof.com/wp-content/uploads/2017/12/brown-basmati-rice-image.jpg",
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Brown Rice",
              style: mainHeading,
            ),
            Text(
              "Pakistan's no one Brown Rice",
              style: productDetail,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              height: 70,
              width: double.infinity,
              color: Colors.green,
              child: Text("Rs. 310/- Per KG", style: pricedetail),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Brown rice is a whole grain rice with the inedible outer hull removed. White rice is the same grain without the hull, the bran layer, and the cereal germ. Red rice, gold rice, and black rice (also called purple rice) are all whole rices with differently pigmented outer layers.",
              style: disRice,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}

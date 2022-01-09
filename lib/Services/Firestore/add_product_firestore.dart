import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddProductFirestore {
  static createAddProduct({
    String des,name,price,quantity,

    File image
  })async {
    Fluttertoast.showToast(msg: 'Creating add product');

    String url = '';
    if (image.path.isNotEmpty) {
      TaskSnapshot taskSnapshot = await FirebaseStorage.instance
          .ref()
          .child('/Add-Product/${DateTime.now()}')
          .putFile(image);

      url = await taskSnapshot.ref.getDownloadURL();
    }

    FirebaseFirestore.instance.collection('Product-Category').doc('8jcp8EHqiLlJohvhpIz6').collection('product').add({
      'description': des,
      'image': url,
      'name':name.trim(),
      'price':price,
      'quantity': quantity
    });

    Fluttertoast.showToast(msg: 'Product_type is created');
  }
}
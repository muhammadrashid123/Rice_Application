import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CategoryFirestore {
  static createCategory({
     String title,
     File image
  })async {
    Fluttertoast.showToast(msg: 'Creating category');

    String url = '';
    if (image.path.isNotEmpty) {
      TaskSnapshot taskSnapshot = await FirebaseStorage.instance
          .ref()
          .child('/Product-Category/${DateTime.now()}')
          .putFile(image);

      url = await taskSnapshot.ref.getDownloadURL();
    }

    FirebaseFirestore.instance.collection('Product-Category').add({
      'title': title.trim(),
      'image': url,
    });

    Fluttertoast.showToast(msg: 'Category created');
  }
}
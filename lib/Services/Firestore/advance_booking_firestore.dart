import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AdvanceBookingFirestore {
  static createAdvanceBooking({
    String date, des,name,price,

    File image
  })async {
    Fluttertoast.showToast(msg: 'Creating advance booking');

    String url = '';
    if (image.path.isNotEmpty) {
      TaskSnapshot taskSnapshot = await FirebaseStorage.instance
          .ref()
          .child('/Advance-Booking/${DateTime.now()}')
          .putFile(image);

      url = await taskSnapshot.ref.getDownloadURL();
    }

    FirebaseFirestore.instance.collection('advance-booking-product').add({
      'date': date,
      'image': url,
      'description': des,
      'name':name.trim(),
      'price':price
    });

    Fluttertoast.showToast(msg: 'Advance booking is created');
  }
}
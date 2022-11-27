import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class DbPrice extends ChangeNotifier {
  final db = FirebaseFirestore.instance.collection("price_list");

  //update Price no imng
  Future<void> updatePrice({
    required String id,
    required String hargaMin,
    required String persentase,
    required String hargaMax,
  }) {
    return db
        .doc(id)
        .update({
          'harga_min': hargaMin,
          'persentase': persentase,
          'harga_max': hargaMax,
        })
        .then(
          (value) => log("Price Updated"),
        )
        .catchError((error) => log("Failed to update Price: $error"));
  }

  //add Price
  Future<void> addPricer({
    required String id,
    required String hargaMin,
    required String persentase,
    required String hargaMax,
  }) {
    
    return db
        .doc(id)
        .set({
          'id' : id,
          'harga_min': hargaMin,
          'persentase': persentase,
          'harga_max': hargaMax,
        })
        .then((docref) => log("Price Added"))
        .catchError((error) => log("Failed to add Price: $error"));
  }


  //add Price
Future<void> deletePrice({required id}) {
  return db
    .doc(id)
    .delete()
    .then((value) => log("User Deleted"))
    .catchError((error) => log("Failed to delete Price: $error"));
}
}
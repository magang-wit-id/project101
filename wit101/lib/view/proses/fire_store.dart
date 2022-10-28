import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class DB {
  final db = FirebaseFirestore.instance;

  //update user no imng
  Future<void> updateUser({
    required String uid,
    required String name,
    required String email,
    required String password,
    required String role,
    required String alamat,
  }) {
    return db
        .collection("bd_userdata")
        .doc(uid)
        .update({
          'name': name,
          'email': email,
          'password': password,
          'role': role,
          'alamat': alamat,
        })
        .then(
          (value) => log("User Updated"),
        )
        .catchError((error) => log("Failed to update user: $error"));
  }
}

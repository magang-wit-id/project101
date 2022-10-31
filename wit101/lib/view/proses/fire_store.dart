import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';


class DB {
  final db = FirebaseFirestore.instance.collection("bd_userdata");

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
        .doc(uid)
        .update({
          'name': name,
          'email': email,
          'password': password,
          'alamat': alamat,
          'role': role,
          
        })
        .then(
          (value) => log("User Updated"),
        )
        .catchError((error) => log("Failed to update user: $error"));
  }

  //add user
  Future<void> addUser({
    required String uid,
    required String name,
    required String email,
    required String password,
    required String role,
    required String alamat,
  }) {
    
    return db
        .doc(uid)
        .set({
          'id_user' : uid,
          'name': name,
          'email': email,
          'password': password,
          'role': role,
          'alamat': alamat,
          'img' : "null"
        })
        .then((docref) => log("User Added"))
        .catchError((error) => log("Failed to add user: $error"));
  }


  //add user
Future<void> deleteUser({required uuid}) {
  return db
    .doc(uuid)
    .delete()
    .then((value) => log("User Deleted"))
    .catchError((error) => log("Failed to delete user: $error"));
}


}

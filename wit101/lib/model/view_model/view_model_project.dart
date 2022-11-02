import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class DB_Project extends ChangeNotifier {

  final db = FirebaseFirestore.instance.collection("bd_project");

   //add Project
  Future<void> addProject({
    required String uid,
    required String projectname,
    required int dealprice,
    required String duration,
    required int worker,
  }) {
    
    return db
        .doc(uid)
        .set({
          'id_project' : uid,
          'projectname': projectname,
          'dealprice': dealprice,
          'duration': duration,
          'worker': worker,
        })
        .then((docref) => log("Project Added"))
        .catchError((error) => log("Failed to add Project: $error"));
  }

}
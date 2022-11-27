import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class DBUser extends ChangeNotifier {
  final db = FirebaseFirestore.instance.collection("bd_userdata");

  //new educ
  final dbEdu = FirebaseFirestore.instance.collection("user_list");

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
    required String img,
    required String role,
    required String alamat,
  }) {
    return db
        .doc(uid)
        .set({
          'id_user': uid,
          'name': name,
          'email': email,
          'img': img,
          'password': password,
          'role': role,
          'alamat': alamat,
        })
        .then((docref) => log("User Added"))
        .catchError((error) => log("Failed to add user: $error"));
  }

  //delete user
  Future<void> deleteUser({required uuid}) {
    return db
        .doc(uuid)
        .delete()
        .then((value) => log("User Deleted"))
        .catchError((error) => log("Failed to delete user: $error"));
  }

//add educattion screen
  Future<void> addEducation({
    required String uid,
    required String newuid,
    required String nameSchool,
    required String major,
    required String startYear,
    required String endYear,
    required String ipk,
  }) {
    return dbEdu
        .doc(uid)
        .collection("education")
        .doc(newuid)
        .set({
          'uidEdu': newuid,
          'nameSchool': nameSchool,
          'major': major,
          'startYear': startYear,
          'endYear': endYear,
          'ipk': ipk,
        })
        .then((docref) => log("Education Added"))
        .catchError((error) => log("Failed to add Education: $error"));
  }

  //delete educattion screen
  Future<void> deleteEducation({
    required String uid,
    required String newuid,
  }) {
    return dbEdu
        .doc(uid)
        .collection("education")
        .doc(newuid)
        .delete()
        .then((value) => log("Education Deleted"))
        .catchError((error) => log("Failed to delete Education: $error"));
  }

  //add skill screen
  Future<void> addSkill({
    required String uid,
    required String newuid,
    required String skill,
    required String level,
    required String note,
  }) {
    return dbEdu
        .doc(uid)
        .collection("skill")
        .doc(newuid)
        .set({'uidSkill': newuid, 'skill': skill, 'level': level, 'note': note})
        .then((docref) => log("Skill Added"))
        .catchError((error) => log("Failed to add Skill: $error"));
  }

  //delete skill screen
  Future<void> deleteSkill({
    required String uid,
    required String newuid,
  }) {
    return dbEdu
        .doc(uid)
        .collection("skill")
        .doc(newuid)
        .delete()
        .then((value) => log("Skill Deleted"))
        .catchError((error) => log("Failed to delete Skill: $error"));
  }

  //add project screen
  Future<void> addProject({
    required String uid,
    required String newuid,
    required String projetName,
    required String platform,
    required String skill,
    required String role,
    required String desc,
  }) {
    return dbEdu
        .doc(uid)
        .collection("project")
        .doc(newuid)
        .set({
          'uidProject': newuid,
          'projetName': projetName,
          'platform': platform,
          'skill': skill,
          'role': role,
          'desc': desc,
        })
        .then((docref) => log("Project Added"))
        .catchError((error) => log("Failed to add Project: $error"));
  }

  //delete project screen
  Future<void> deleteProject({
    required String uid,
    required String newuid,
  }) {
    return dbEdu
        .doc(uid)
        .collection("project")
        .doc(newuid)
        .delete()
        .then((value) => log("Project Deleted"))
        .catchError((error) => log("Failed to delete Project: $error"));
  }

  //add expirence screen
  Future<void> addExpirence({
    required String uid,
    required String newuid,
    required String agency,
    required String startYear,
    required String endYear,
    required String phoneNumber,
    required String address,
    required String company,
    required String possion,
  }) {
    return dbEdu
        .doc(uid)
        .collection("expirence")
        .doc(newuid)
        .set({
          'uidExpirence': newuid,
          'agency': agency,
          'startYear': startYear,
          'endYear': endYear,
          'phoneNumber': phoneNumber,
          'address': address,
          'company': company,
          'possion': possion,
        })
        .then((docref) => log("Expirence Added"))
        .catchError((error) => log("Failed to add Expirence: $error"));
  }

  //delete expirence screen
  Future<void> deleteExpirence({
    required String uid,
    required String newuid,
  }) {
    return dbEdu
        .doc(uid)
        .collection("expirence")
        .doc(newuid)
        .delete()
        .then((value) => log("Expirence Deleted"))
        .catchError((error) => log("Failed to delete Expirence: $error"));
  }

  //add full add new user screen
  Future<void> addFullProfile({
    required String uid,
    required String fullName,
    required String age,
    required String gender,
    required String position,
    required String email,
    required String github,
    required String lamaBerkerja,
  }) {
    return dbEdu
        .doc(uid)
        .update({
          'id_user': uid,
          'fullName': fullName,
          'age': age,
          'gender': gender,
          'position': position,
          'email': email,
          'github': github,
          'lamaBerkerja': lamaBerkerja,
        })
        .then((docref) => log("USSER Added"))
        .catchError((error) => log("Failed to add USSER: $error"));
  }

  //delete full add new user screen
  Future<void> deleteFullProfile({
    required String uid,
  }) {
    return dbEdu
        .doc(uid)
        .delete()
        .then((value) => log("USSER Deleted"))
        .catchError((error) => log("Failed to delete USSER: $error"));
  }
}

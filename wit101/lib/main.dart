import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wit101/view/screens/addproject.dart';
import 'package:wit101/view/screens/adduser.dart';
import 'package:wit101/view/screens/dashboard.dart';
import 'package:wit101/view/screens/profile_screen.dart';
import 'package:wit101/view/screens/projectlist.dart';
import 'package:wit101/view/screens/userlist.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const Dashboard(),
    ); 
  }
}

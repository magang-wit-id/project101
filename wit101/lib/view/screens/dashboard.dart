import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wit101/utility/poppins_text.dart';
import 'package:wit101/utility/warna.dart';
import 'package:wit101/widgets/drawer_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  var auth = FirebaseAuth.instance;

  var firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    auth.idTokenChanges().listen((User? user) {
      if (user == null) {
        log('User is currently signed out!');
      } else {
        auth.currentUser?.getIdToken(true);
        log('gogo login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: firestore
            .collection('bd_userdata')
            .doc(auth.currentUser!.uid)
            .snapshots(),
        builder: (context, snapshots) {
          var data = snapshots.data;
          return Scaffold(
            extendBodyBehindAppBar: true,
            key: scaffoldKey,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            drawer: const MyDrawer(),
            body: SingleChildScrollView(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 141,
                    decoration: BoxDecoration(
                      color: MyColors.red(),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: 13,
                          top: 50,
                          child: PoppinsText.custom(
                              text: 'Welcome, ${data?['name']}',
                              fontSize: 16,
                              warna: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  cardDashboard(),
                  Container(
                    alignment: Alignment.topCenter,
                    padding: const EdgeInsets.only(top: 267),
                    child: Column(
                      children: [
                        income(),
                        const SizedBox(
                          height: 18,
                        ),
                        revenue(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget banner(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 141,
      decoration: BoxDecoration(
        color: MyColors.red(),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 13,
            top: 50,
            child: PoppinsText.custom(
                text: 'Welcome, ',
                fontSize: 16,
                warna: Colors.white,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }

  Widget cardDashboard() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 96),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 180,
              height: 82,
              child: Stack(
                children: [
                  Image.asset('assets/png/income.png'),
                  Positioned(
                    top: 12,
                    left: 8,
                    child: PoppinsText.custom(
                        text: 'Average Income',
                        fontSize: 10,
                        warna: const Color.fromRGBO(33, 33, 33, 1),
                        fontWeight: FontWeight.w500),
                  ),
                  Positioned(
                    top: 33,
                    left: 8,
                    child: PoppinsText.custom(
                        text: 'Rp. 2.500.000',
                        fontSize: 14,
                        warna: const Color.fromRGBO(33, 33, 33, 1),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 170,
              height: 82,
              child: Stack(
                children: [
                  Image.asset('assets/png/finish.png'),
                  Positioned(
                    top: 12,
                    left: 8,
                    child: PoppinsText.custom(
                        text: 'Finished Project',
                        fontSize: 10,
                        warna: const Color.fromRGBO(33, 33, 33, 1),
                        fontWeight: FontWeight.w500),
                  ),
                  Positioned(
                    top: 33,
                    left: 8,
                    child: PoppinsText.custom(
                        text: '(0) Project',
                        fontSize: 14,
                        warna: const Color.fromRGBO(33, 33, 33, 1),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 180,
              height: 82,
              child: Stack(
                children: [
                  Image.asset('assets/png/onprogress.png'),
                  Positioned(
                    top: 12,
                    left: 8,
                    child: PoppinsText.custom(
                        text: 'On Progress Task',
                        fontSize: 10,
                        warna: const Color.fromRGBO(33, 33, 33, 1),
                        fontWeight: FontWeight.w500),
                  ),
                  Positioned(
                    top: 33,
                    left: 8,
                    child: PoppinsText.custom(
                        text: '(1) Project',
                        fontSize: 14,
                        warna: const Color.fromRGBO(33, 33, 33, 1),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 170,
              height: 82,
              child: Stack(
                children: [
                  Image.asset('assets/png/pending.png'),
                  Positioned(
                    top: 12,
                    left: 8,
                    child: PoppinsText.custom(
                        text: 'Pending Request',
                        fontSize: 10,
                        warna: const Color.fromRGBO(33, 33, 33, 1),
                        fontWeight: FontWeight.w500),
                  ),
                  Positioned(
                    top: 33,
                    left: 8,
                    child: PoppinsText.custom(
                        text: '(0) Project',
                        fontSize: 14,
                        warna: const Color.fromRGBO(33, 33, 33, 1),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget income() {
    return Container(
      width: 350,
      height: 250,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(248, 249, 253, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 5,
            left: 10,
            child: PoppinsText.custom(
              text: 'Average Income',
              fontSize: 12,
              warna: const Color.fromRGBO(66, 66, 66, 1),
              fontWeight: FontWeight.w600,
            ),
          ),
          Center(
            child: SizedBox(
              child: Image.asset('assets/png/grafik.png'),
            ),
          ),
        ],
      ),
    );
  }

  Widget revenue() {
    return Container(
      width: 350,
      height: 250,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(248, 249, 253, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 516, left: 25),
            child: PoppinsText.custom(
                text: 'Revenue Sources',
                fontSize: 12,
                warna: const Color.fromRGBO(66, 66, 66, 1),
                fontWeight: FontWeight.w600),
          ),
          Center(
            child: SizedBox(
              child: Image.asset('assets/png/sources.png'),
            ),
          ),
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(28, 200, 138, 1),
                  shape: BoxShape.circle,
                ),
                margin: const EdgeInsets.only(top: 220, left: 25),
              ),
              Container(
                child: PoppinsText.custom(
                    text: 'Hijau',
                    fontSize: 10,
                    warna: const Color.fromRGBO(33, 33, 33, 1),
                    fontWeight: FontWeight.w400),
                margin: const EdgeInsets.only(top: 220, left: 4),
              ),
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(246, 194, 62, 1),
                  shape: BoxShape.circle,
                ),
                margin: const EdgeInsets.only(top: 220, left: 20),
              ),
              Container(
                child: PoppinsText.custom(
                    text: 'Kuning',
                    fontSize: 10,
                    warna: const Color.fromRGBO(33, 33, 33, 1),
                    fontWeight: FontWeight.w400),
                margin: const EdgeInsets.only(top: 220, left: 4),
              ),
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(78, 115, 231, 1),
                  shape: BoxShape.circle,
                ),
                margin: const EdgeInsets.only(top: 220, left: 20),
              ),
              Container(
                child: PoppinsText.custom(
                    text: 'Biru',
                    fontSize: 10,
                    warna: const Color.fromRGBO(33, 33, 33, 1),
                    fontWeight: FontWeight.w400),
                margin: const EdgeInsets.only(top: 220, left: 4),
              ),
            ],
          )
        ],
      ),
    );
  }
}

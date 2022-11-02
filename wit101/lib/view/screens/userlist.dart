import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wit101/utility/poppins_text.dart';
import 'package:wit101/utility/warna.dart';
import 'package:wit101/widgets/drawer_screen.dart';

import 'detailuser.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  var controlerSearch = TextEditingController();

  toDetail(DocumentSnapshot post) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => DetailUser(post: post)));
  }

  Future<QuerySnapshot>? postDocumentList;
  String userNameText = "";

  initSearchPost(String textEntered) {
    if (controlerSearch.text.isEmpty){
      postDocumentList = FirebaseFirestore.instance
        .collection('bd_userdata')
        .get();

    setState(() {
      postDocumentList;
    });
    }else if (controlerSearch.text.isNotEmpty){
      postDocumentList = FirebaseFirestore.instance
        .collection('bd_userdata')
        .where("name", isEqualTo: controlerSearch.text)
        .get();

    setState(() {
      postDocumentList;
    });
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          Stack(
            children: [
              banner(),
              Container(
                padding: const EdgeInsets.only(top: 130, left: 10, right: 10),
                alignment: Alignment.center,
                child: searchView(),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('bd_userdata')
                       .where("name", isGreaterThanOrEqualTo: controlerSearch.text)
                      .snapshots(),
                  builder: (context, snapshots) {
                    return (snapshots.connectionState ==
                            ConnectionState.waiting)
                        ? const Center()
                        : ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            itemCount: snapshots.data?.docs.length,
                            itemBuilder: (context, index) {
                              var data = snapshots.data?.docs[index];

                              return SizedBox(
                                width: 360,
                                height: 70,
                                child: GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    toDetail(snapshots.data!.docs[index]);
                                  },
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage:
                                            NetworkImage(data?['img']),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      PoppinsText.custom(
                                          text: data?['name'],
                                          fontSize: 15,
                                          warna: MyColors.black(),
                                          fontWeight: FontWeight.w500),
                                    ],
                                  ),
                                ),
                              );
                            });
                  })),
        ],
      ),
    );
  }

  Widget banner() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
        color: Color.fromRGBO(232, 23, 31, 1),
      ),
      width: MediaQuery.of(context).size.width,
      height: 154,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 89,
            left: 20,
            child: PoppinsText.custom(
                text: 'User List',
                fontSize: 16,
                warna: Colors.white,
                fontWeight: FontWeight.w700),
          ),
          Container(
            alignment: Alignment.topRight,
            child: Image.asset(
              'assets/png/circle_5.png',
              alignment: Alignment.topRight,
            ),
          ),
        ],
      ),
    );
  }

  Widget searchView() {
    return SizedBox(
      height: 50,
      child: TextFormField(
        onChanged: (textEntered) {
          setState(() {
            userNameText = textEntered;
          });
          initSearchPost(textEntered);
        },
        controller: controlerSearch,
        decoration: InputDecoration(
          // ignore: prefer_const_constructors
          suffixIcon: IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              initSearchPost(userNameText);
            },
          ),
          hintText: 'Search',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              width: 2.5,
              color: MyColors.lightGrey(),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              width: 2.5,
              color: MyColors.lightGrey(),
            ),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:wit101/utility/poppins_text.dart';
import 'package:wit101/utility/warna.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          banner(),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: listUser(),
          ),
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
          Positioned(
            left: 300,
            child: Image.asset('assets/png/circle_4.png'),
          ),
          Positioned(
            top: 130,
            left: 10,
            child: Container(
              height: 50,
              width: 370,
              child: searchView(),
            ),
          )
        ],
      ),
    );
  }

  Widget searchView() {
    return TextField(
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.search),
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
    );
  }

  Widget listUser() {
    return ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics()),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 360,
            height: 70,
            child: Row(
              children: [
                Image.asset('assets/png/profile2.png'),
                SizedBox(width: 20,),
                PoppinsText.custom(
                    text: 'Admin',
                    fontSize: 15,
                    warna: MyColors.black(),
                    fontWeight: FontWeight.w500),
              ],
            ),
          );
        });
  }
}

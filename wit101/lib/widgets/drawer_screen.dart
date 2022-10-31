import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wit101/utility/poppins_text.dart';
import 'package:wit101/utility/warna.dart';
import 'package:wit101/view/proses/auth.dart';
import 'package:wit101/view/screens/addproject.dart';
import 'package:wit101/view/screens/adduser.dart';
import 'package:wit101/view/screens/dashboard.dart';
import 'package:wit101/view/screens/login_screen.dart';
import 'package:wit101/view/screens/profile_screen.dart';
import 'package:wit101/view/screens/projectlist.dart';
import 'package:wit101/view/screens/userlist.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('bd_userdata')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context, snapshots) {
          var data = snapshots.data;
          String? imgeGet = data?['img'];
            return Drawer(
              child: Stack(
                children: [
                  const Align(
                      alignment: Alignment.bottomLeft,
                      child: Image(
                          image: AssetImage('assets/png/circle_4.png'),
                          alignment: Alignment.bottomLeft,
                          filterQuality: FilterQuality.high)),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      DrawerHeader(
                          decoration: BoxDecoration(
                              color: MyColors.black(),
                              image: const DecorationImage(
                                  image: AssetImage('assets/png/circle_6.png'),
                                  alignment: Alignment.topRight,
                                  filterQuality: FilterQuality.high)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ProfileScreen()));
                                },
                                child: CircleAvatar(
                                  radius: 35.0,
                                  backgroundColor: Colors.white,
                                  backgroundImage: NetworkImage(imgeGet.toString())
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 16),
                                width: 102,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: PoppinsText.custom(
                                      text: '${data?['name']}',
                                      fontSize: 16,
                                      warna: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              const SizedBox(
                                width: 100,
                              ),
                            ],
                          )),
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            const Padding(
                                padding: EdgeInsets.only(
                              top: 10,
                            )),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(PageRouteBuilder(
                                    pageBuilder: ((context, animation,
                                        secondaryAnimation) {
                                  return const Dashboard();
                                }), transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                  return SlideTransition(
                                    position: Tween<Offset>(
                                      begin: const Offset(-0.7, 0),
                                      end: Offset.zero,
                                    ).animate(animation),
                                    child: child,
                                  );
                                }));
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Image(
                                    image: AssetImage('assets/png/Vector.png'),
                                    width: 18,
                                    height: 18,
                                    color: Colors.black,
                                  ),
                                  PoppinsText.custom(
                                      text: 'Dashboard',
                                      fontSize: 12,
                                      warna: MyColors.black(),
                                      fontWeight: FontWeight.w500),
                                  const Padding(
                                      padding: EdgeInsets.only(left: 120)),
                                  const SizedBox(
                                    height: 40,
                                  )
                                ],
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(bottom: 10)),
                            Container(
                              height: 2,
                              color: Colors.grey.shade300,
                            ),
                            ExpansionTile(
                              textColor: MyColors.red(),
                              iconColor: MyColors.red(),
                              title: const Text(
                                'User',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                              leading:
                                  const Icon((Icons.perm_identity_rounded)),
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                PageRouteBuilder(pageBuilder:
                                                    ((context, animation,
                                                        secondaryAnimation) {
                                              return const UserList();
                                            }), transitionsBuilder: (context,
                                                    animation,
                                                    secondaryAnimation,
                                                    child) {
                                              return SlideTransition(
                                                position: Tween<Offset>(
                                                  begin: const Offset(-0.7, 0),
                                                  end: Offset.zero,
                                                ).animate(animation),
                                                child: child,
                                              );
                                            }));
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              const Icon(Icons.people),
                                              PoppinsText.custom(
                                                  text: 'User List',
                                                  fontSize: 12,
                                                  warna: MyColors.black(),
                                                  fontWeight: FontWeight.w500),
                                              const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 120)),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                PageRouteBuilder(pageBuilder:
                                                    ((context, animation,
                                                        secondaryAnimation) {
                                              return const AddUser();
                                            }), transitionsBuilder: (context,
                                                    animation,
                                                    secondaryAnimation,
                                                    child) {
                                              return SlideTransition(
                                                position: Tween<Offset>(
                                                  begin: const Offset(-0.7, 0),
                                                  end: Offset.zero,
                                                ).animate(animation),
                                                child: child,
                                              );
                                            }));
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              const Icon(Icons.person_add),
                                              PoppinsText.custom(
                                                  text: 'User Add',
                                                  fontSize: 12,
                                                  warna: MyColors.black(),
                                                  fontWeight: FontWeight.w500),
                                              const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 120)),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            const Icon(Icons.groups_rounded),
                                            PoppinsText.custom(
                                                text: 'Role List',
                                                fontSize: 12,
                                                warna: MyColors.black(),
                                                fontWeight: FontWeight.w500),
                                            const Padding(
                                                padding:
                                                    EdgeInsets.only(left: 120)),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            ExpansionTile(
                              textColor: MyColors.red(),
                              iconColor: MyColors.red(),
                              title: const Text(
                                'Project',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                              leading: const Icon(Icons.wallet),
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                PageRouteBuilder(pageBuilder:
                                                    ((context, animation,
                                                        secondaryAnimation) {
                                              return const Projectlist();
                                            }), transitionsBuilder: (context,
                                                    animation,
                                                    secondaryAnimation,
                                                    child) {
                                              return SlideTransition(
                                                position: Tween<Offset>(
                                                  begin: const Offset(-0.7, 0),
                                                  end: Offset.zero,
                                                ).animate(animation),
                                                child: child,
                                              );
                                            }));
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Image(
                                                image: const AssetImage(
                                                    'assets/png/iconShare.png'),
                                                width: 20,
                                                height: 20,
                                                color: MyColors.black(),
                                              ),
                                              PoppinsText.custom(
                                                  text: 'Project List',
                                                  fontSize: 12,
                                                  warna: MyColors.black(),
                                                  fontWeight: FontWeight.w500),
                                              const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 120)),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                PageRouteBuilder(pageBuilder:
                                                    ((context, animation,
                                                        secondaryAnimation) {
                                              return const Addproject();
                                            }), transitionsBuilder: (context,
                                                    animation,
                                                    secondaryAnimation,
                                                    child) {
                                              return SlideTransition(
                                                position: Tween<Offset>(
                                                  begin: const Offset(-0.7, 0),
                                                  end: Offset.zero,
                                                ).animate(animation),
                                                child: child,
                                              );
                                            }));
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              const Icon(Icons
                                                  .create_new_folder_rounded),
                                              PoppinsText.custom(
                                                  text: 'Add Project',
                                                  fontSize: 12,
                                                  warna: MyColors.black(),
                                                  fontWeight: FontWeight.w500),
                                              const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 120)),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            const Icon(Icons.folder_copy_sharp),
                                            PoppinsText.custom(
                                                text: 'Join Project',
                                                fontSize: 12,
                                                warna: MyColors.black(),
                                                fontWeight: FontWeight.w500),
                                            const Padding(
                                                padding:
                                                    EdgeInsets.only(left: 120)),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            ExpansionTile(
                              textColor: MyColors.red(),
                              iconColor: MyColors.red(),
                              title: const Text(
                                'Pricing',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                              leading: const Icon(Icons.attach_money_rounded),
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            const Icon(Icons.wallet),
                                            PoppinsText.custom(
                                                text: 'Price List',
                                                fontSize: 12,
                                                warna: MyColors.black(),
                                                fontWeight: FontWeight.w500),
                                            const Padding(
                                                padding:
                                                    EdgeInsets.only(left: 120)),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            const Icon(
                                                Icons.price_change_outlined),
                                            PoppinsText.custom(
                                                text: 'Add Price',
                                                fontSize: 12,
                                                warna: MyColors.black(),
                                                fontWeight: FontWeight.w500),
                                            const Padding(
                                                padding:
                                                    EdgeInsets.only(left: 120)),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 2,
                              color: Colors.grey.shade300,
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SvgPicture.asset('assets/svg/iconLogout.svg'),
                                  TextButton(
                                      style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                MyColors.red()),
                                      ),
                                      onPressed: () {
                                        Auth().signOut().then((result) =>
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const LoginScreen())));
                                      },
                                      child: PoppinsText.custom(
                                          text: "Logout",
                                          fontSize: 12,
                                          warna: MyColors.black(),
                                          fontWeight: FontWeight.w500)),
                                  const Padding(
                                      padding: EdgeInsets.only(left: 140)),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                ]),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          
        });
  }
}

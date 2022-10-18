import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wit101/utility/poppins_text.dart';
import 'package:wit101/utility/warna.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                  color: MyColors.black(),
                  image: const DecorationImage(
                      image: AssetImage('assets/png/circle_3.png'),
                      alignment: Alignment.topRight,
                      filterQuality: FilterQuality.high)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const CircleAvatar(
                    radius: 35.0,
                    backgroundColor: Colors.white,
                  ),
                  PoppinsText.custom(
                      text: 'ADMIN',
                      fontSize: 16,
                      warna: Colors.white,
                      fontWeight: FontWeight.w700),
                  const SizedBox(
                    width: 100,
                  ),
                ],
              )),
          const Padding(
              padding: EdgeInsets.only(
            top: 10,
          )),
          GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                const Padding(padding: EdgeInsets.only(left: 120)),
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
            title: PoppinsText.custom(
                text: 'User',
                fontSize: 12,
                warna: MyColors.black(),
                fontWeight: FontWeight.w500),
            leading: const Icon(
              Icons.person_outline,
              color: Colors.black,
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    color: Colors.grey.shade100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(Icons.people),
                            PoppinsText.custom(
                                text: 'User List',
                                fontSize: 12,
                                warna: MyColors.black(),
                                fontWeight: FontWeight.w500),
                            const Padding(padding: EdgeInsets.only(left: 120)),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(Icons.person_add),
                            PoppinsText.custom(
                                text: 'User Add',
                                fontSize: 12,
                                warna: MyColors.black(),
                                fontWeight: FontWeight.w500),
                            const Padding(padding: EdgeInsets.only(left: 120)),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(Icons.groups_rounded),
                            PoppinsText.custom(
                                text: 'Role List',
                                fontSize: 12,
                                warna: MyColors.black(),
                                fontWeight: FontWeight.w500),
                            const Padding(padding: EdgeInsets.only(left: 120)),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: PoppinsText.custom(
                text: 'Project',
                fontSize: 12,
                warna: MyColors.black(),
                fontWeight: FontWeight.w500),
            leading: const Icon(
              Icons.folder_outlined,
              color: Colors.black,
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    color: Colors.grey.shade100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image(
                              image:
                                  const AssetImage('assets/png/iconShare.png'),
                              width: 20,
                              height: 20,
                              color: MyColors.black(),
                            ),
                            PoppinsText.custom(
                                text: 'Project List',
                                fontSize: 12,
                                warna: MyColors.black(),
                                fontWeight: FontWeight.w500),
                            const Padding(padding: EdgeInsets.only(left: 120)),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(Icons.create_new_folder_rounded),
                            PoppinsText.custom(
                                text: 'Add Project',
                                fontSize: 12,
                                warna: MyColors.black(),
                                fontWeight: FontWeight.w500),
                            const Padding(padding: EdgeInsets.only(left: 120)),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(Icons.folder_copy_sharp),
                            PoppinsText.custom(
                                text: 'Join Project',
                                fontSize: 12,
                                warna: MyColors.black(),
                                fontWeight: FontWeight.w500),
                            const Padding(padding: EdgeInsets.only(left: 120)),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: PoppinsText.custom(
                text: 'Pricing',
                fontSize: 12,
                warna: MyColors.black(),
                fontWeight: FontWeight.w500),
            leading: Image(
              image: const AssetImage('assets/png/iconPrice.png'),
              width: 18,
              height: 18,
              color: MyColors.black(),
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    color: Colors.grey.shade100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(Icons.wallet),
                            PoppinsText.custom(
                                text: 'Price List',
                                fontSize: 12,
                                warna: MyColors.black(),
                                fontWeight: FontWeight.w500),
                            const Padding(padding: EdgeInsets.only(left: 120)),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(Icons.price_change_outlined),
                            PoppinsText.custom(
                                text: 'Add Price',
                                fontSize: 12,
                                warna: MyColors.black(),
                                fontWeight: FontWeight.w500),
                            const Padding(padding: EdgeInsets.only(left: 120)),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 2,
            color: Colors.grey.shade300,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            SvgPicture.asset('assets/svg/iconLogout.svg'),
            PoppinsText.custom(
                text: 'Logout',
                fontSize: 12,
                warna: MyColors.black(),
                fontWeight: FontWeight.w500),
            const Padding(padding: EdgeInsets.only(left: 140)),
            const SizedBox(
              height: 40,
            ),
          ]),
          const Image(
              image: AssetImage('assets/png/circle_4.png'),
              alignment: Alignment.bottomLeft,
              filterQuality: FilterQuality.high)
        ],
      ),
    );
  }
}

class ChangeColor {
  bool selected = false;
}

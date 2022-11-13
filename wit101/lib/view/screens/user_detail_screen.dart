import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wit101/utility/custom_icon.dart';
import 'package:wit101/utility/poppins_text.dart';
import 'package:wit101/utility/warna.dart';

class UserDetailScreen extends StatefulWidget {
  const UserDetailScreen({super.key});

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: MyColors.black(),
          extendBodyBehindAppBar: true,
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  child: Image.asset('assets/png/circle_1.png'),
                ),
                Positioned(
                  top: 35,
                  right: 0,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 19, left: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: SvgPicture.asset(
                              'assets/svg/profile_back_icon.svg'),
                        ),
                        SizedBox(
                          height: 24,
                          width: 80,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: MyColors.red(),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/svg/export_logo.svg'),
                                const SizedBox(width: 4),
                                PoppinsText.custom(
                                    text: 'Export',
                                    fontSize: 10,
                                    warna: Colors.white,
                                    fontWeight: FontWeight.w500)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // ini adalah container putih di halaman bagian bawah yang setengah layar
                // tabbar nya ada dibagian bawah code ini di dalam column
                Positioned(
                  top: 295,
                  bottom: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(25)),
                    ),
                    child: TabBarView(
                      children: [
                        tabBarProfile(),
                        tabBarEducation(),
                        tabBarSkills(),
                        tabBarProject(),
                        tabBarExperience(),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 100,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 33),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: 40,
                            ),
                            const SizedBox(width: 30),
                            Expanded(
                              child: SizedBox(
                                child: Text(
                                  'Muhammad Rizky Pratama S',
                                  maxLines: 2,
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: MyColors.black(),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: const BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                          'assets/svg/edit_logo.svg'),
                                      const SizedBox(width: 6),
                                      PoppinsText.custom(
                                          text: 'Edit User',
                                          fontSize: 12,
                                          warna: Colors.white,
                                          fontWeight: FontWeight.w500)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: SizedBox(
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: MyColors.red(),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                          'assets/svg/delete_logo.svg'),
                                      const SizedBox(width: 6),
                                      PoppinsText.custom(
                                          text: 'Delete User',
                                          fontSize: 12,
                                          warna: Colors.white,
                                          fontWeight: FontWeight.w500)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          height: 61,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 5, left: 10, right: 17),
                            child: TabBar(
                              labelPadding:
                                  const EdgeInsets.symmetric(horizontal: 0.1),
                              labelStyle: GoogleFonts.poppins(
                                  fontSize: 10, fontWeight: FontWeight.w700),
                              unselectedLabelColor: MyColors.black(),
                              labelColor: MyColors.red(),
                              indicator: const BoxDecoration(
                                  color: Colors.transparent),
                              tabs: const [
                                Tab(
                                  iconMargin: EdgeInsets.only(bottom: 3),
                                  text: 'Profile',
                                  icon: Icon(UgongIcons.profile, size: 20),
                                ),
                                Tab(
                                  iconMargin: EdgeInsets.only(bottom: 3),
                                  text: 'Education',
                                  icon: Icon(UgongIcons.education, size: 20),
                                ),
                                Tab(
                                  iconMargin: EdgeInsets.only(bottom: 3),
                                  text: 'Skills',
                                  icon: Icon(UgongIcons.skill, size: 20),
                                ),
                                Tab(
                                  iconMargin: EdgeInsets.only(bottom: 3),
                                  text: 'Project',
                                  icon: Icon(UgongIcons.project, size: 20),
                                ),
                                Tab(
                                  iconMargin: EdgeInsets.only(bottom: 3),
                                  text: 'Experience',
                                  icon: Icon(UgongIcons.experience, size: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget tabBarProfile() {
  return Padding(
    padding: const EdgeInsets.only(top: 55, bottom: 20, left: 22, right: 22),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: MyColors.lightGrey(),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(19),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PoppinsText.custom(
                    text: 'Age',
                    fontSize: 12,
                    warna: const Color.fromARGB(255, 33, 33, 33),
                    fontWeight: FontWeight.w500),
                PoppinsText.custom(
                    text: '20',
                    fontSize: 12,
                    warna: const Color.fromARGB(255, 156, 156, 156),
                    fontWeight: FontWeight.w500)
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PoppinsText.custom(
                    text: 'Gender',
                    fontSize: 12,
                    warna: const Color.fromARGB(255, 33, 33, 33),
                    fontWeight: FontWeight.w500),
                PoppinsText.custom(
                    text: 'Laki-Laki',
                    fontSize: 12,
                    warna: const Color.fromARGB(255, 156, 156, 156),
                    fontWeight: FontWeight.w500)
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PoppinsText.custom(
                    text: 'Position',
                    fontSize: 12,
                    warna: const Color.fromARGB(255, 33, 33, 33),
                    fontWeight: FontWeight.w500),
                PoppinsText.custom(
                    text: 'Product Manager',
                    fontSize: 12,
                    warna: const Color.fromARGB(255, 156, 156, 156),
                    fontWeight: FontWeight.w500)
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PoppinsText.custom(
                    text: 'Email',
                    fontSize: 12,
                    warna: const Color.fromARGB(255, 33, 33, 33),
                    fontWeight: FontWeight.w500),
                PoppinsText.custom(
                    text: 'rizky@gmail.com',
                    fontSize: 12,
                    warna: const Color.fromARGB(255, 156, 156, 156),
                    fontWeight: FontWeight.w500)
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PoppinsText.custom(
                    text: 'Github',
                    fontSize: 12,
                    warna: const Color.fromARGB(255, 33, 33, 33),
                    fontWeight: FontWeight.w500),
                PoppinsText.custom(
                    text: 'Rizkyyy',
                    fontSize: 12,
                    warna: const Color.fromARGB(255, 156, 156, 156),
                    fontWeight: FontWeight.w500)
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PoppinsText.custom(
                    text: 'Lama Bekerja',
                    fontSize: 12,
                    warna: const Color.fromARGB(255, 33, 33, 33),
                    fontWeight: FontWeight.w500),
                PoppinsText.custom(
                    text: '2 Bulan',
                    fontSize: 12,
                    warna: const Color.fromARGB(255, 156, 156, 156),
                    fontWeight: FontWeight.w500)
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget tabBarEducation() {
  return Padding(
    padding: const EdgeInsets.only(top: 55, bottom: 20, left: 22, right: 22),
    child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: MyColors.lightGrey(),
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
          physics: const BouncingScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color.fromARGB(255, 33, 33, 33),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'SMA Negeri 00 Bandung',
                        style: GoogleFonts.poppins(
                          color: const Color.fromARGB(255, 33, 33, 33),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 5,
                      ),
                      Text(
                        '2016 - 2019',
                        style: GoogleFonts.poppins(
                          color: const Color.fromARGB(255, 33, 33, 33),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                        ),
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        )),
  );
}

Widget tabBarSkills() {
  return Padding(
    padding: const EdgeInsets.only(top: 55, bottom: 20, left: 22, right: 22),
    child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: MyColors.lightGrey(),
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
          physics: const BouncingScrollPhysics(),
          itemCount: 1,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color.fromARGB(255, 33, 33, 33),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Dart / Flutter',
                        style: GoogleFonts.poppins(
                          color: const Color.fromARGB(255, 33, 33, 33),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 5,
                      ),
                      Text(
                        'Expert',
                        style: GoogleFonts.poppins(
                          color: const Color.fromARGB(255, 33, 33, 33),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                        ),
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        )),
  );
}

Widget tabBarProject() {
  return Padding(
    padding: const EdgeInsets.only(top: 55, bottom: 20, left: 22, right: 22),
    child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: MyColors.lightGrey(),
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
          physics: const BouncingScrollPhysics(),
          itemCount: 2,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color.fromARGB(255, 33, 33, 33),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Lapargan v1.0',
                        style: GoogleFonts.poppins(
                          color: const Color.fromARGB(255, 33, 33, 33),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 5,
                      ),
                      Text(
                        'php',
                        style: GoogleFonts.poppins(
                          color: const Color.fromARGB(255, 33, 33, 33),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                        ),
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        )),
  );
}

Widget tabBarExperience() {
  return Padding(
    padding: const EdgeInsets.only(top: 55, bottom: 20, left: 22, right: 22),
    child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: MyColors.lightGrey(),
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
          physics: const BouncingScrollPhysics(),
          itemCount: 1,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color.fromARGB(255, 33, 33, 33),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Kampus Merdeka',
                        style: GoogleFonts.poppins(
                          color: const Color.fromARGB(255, 33, 33, 33),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 5,
                      ),
                      Text(
                        'Maret 2022 - Agustus 2022',
                        style: GoogleFonts.poppins(
                          color: const Color.fromARGB(255, 33, 33, 33),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                        ),
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        )),
  );
}

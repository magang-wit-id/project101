import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:printing/printing.dart';
import 'package:wit101/model/view_model/view_model_user.dart';
import 'package:wit101/utility/custom_icon.dart';
import 'package:wit101/utility/poppins_text.dart';
import 'package:wit101/utility/warna.dart';
import 'package:wit101/view/screens/userlist.dart';

class UserDetailScreen extends StatefulWidget {
  final DocumentSnapshot post;
  const UserDetailScreen({super.key, required this.post});

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  void getPdf() async {
    //class
    final pdf = pw.Document();

    //img network
    final netImage = await networkImage(widget.post.get('img').toString());


    pdf.addPage(pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (
          pw.Context context,
        ) {
          return <pw.Widget>[
            pw.Wrap(children: [
              pw.Center(
                child: pw.Container(
                  width: 170,
                  height: 170,
                  decoration: pw.BoxDecoration(
                      shape: pw.BoxShape.circle,
                      color: PdfColors.black,
                      border: pw.Border.all(
                        color: PdfColors.black,
                        width: 3,
                      ),
                      image: pw.DecorationImage(
                          fit: pw.BoxFit.fill, image: netImage)),
                ),
              ),
              pw.Container(height: 10),
              pw.Container(
                  alignment: pw.Alignment.center,
                  width: 650,
                  height: 40,
                  decoration: pw.BoxDecoration(
                    shape: pw.BoxShape.rectangle,
                    border: pw.Border.all(
                      color: PdfColors.black,
                      width: 3,
                    ),
                  ),
                  child: pw.Text("Profile",
                      style: const pw.TextStyle(fontSize: 24))),
              pw.Container(height: 10),
              pw.Container(
                  alignment: pw.Alignment.centerLeft,
                  child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text("Nama ${widget.post.get("fullName")}",
                            style: const pw.TextStyle(fontSize: 18),
                            textAlign: pw.TextAlign.justify),
                        pw.Text("Age ${widget.post.get("age")}",
                            style: const pw.TextStyle(fontSize: 18)),
                        pw.Text("Gender ${widget.post.get("gender")}",
                            style: const pw.TextStyle(fontSize: 18)),
                        pw.Text("Position ${widget.post.get("position")}",
                            style: const pw.TextStyle(fontSize: 18),
                            textAlign: pw.TextAlign.justify),
                        pw.Text("Email ${widget.post.get("email")}",
                            style: const pw.TextStyle(fontSize: 18)),
                        pw.Text("Github ${widget.post.get("github")}",
                            style: const pw.TextStyle(fontSize: 18)),
                        pw.Text("LOE ${widget.post.get("lamaBerkerja")}",
                            style: const pw.TextStyle(fontSize: 18)),
                      ])),
              pw.Container(height: 10),
              pw.Container(
                  alignment: pw.Alignment.center,
                  width: 650,
                  height: 40,
                  decoration: pw.BoxDecoration(
                    shape: pw.BoxShape.rectangle,
                    border: pw.Border.all(
                      color: PdfColors.black,
                      width: 3,
                    ),
                  ),
                  child: pw.Text("Education",
                      style: const pw.TextStyle(fontSize: 24))),
              pw.Container(
                  alignment: pw.Alignment.centerLeft,
                  child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text("Nama ${widget.post.get("nameSchool")}",
                            style: const pw.TextStyle(fontSize: 18),
                            textAlign: pw.TextAlign.justify),
                      ])),
            ])
          ];
        }));

    //save
    Uint8List bytes = await pdf.save();

    //filse save
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/cobapdf.pdf');

    //replace file
    await file.writeAsBytes(bytes, flush: true);

    //open pdf
    await OpenFile.open(file.path);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('user_list')
            .doc(widget.post.get('id_user'))
            .snapshots(),
        builder: (context, snapshots) {
          var data = snapshots.data;

          if (snapshots.hasData && !snapshots.data!.exists) {
            log("Akun Hapus");
            return const Center();
          }

          if ((snapshots.connectionState == ConnectionState.waiting)) {
            return const Center();
          } else {
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
                                    onPressed: () async {
                                      getPdf();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: MyColors.red(),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                            'assets/svg/export_logo.svg'),
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
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(25)),
                            ),
                            child: TabBarView(
                              children: [
                                tabBarProfile(data!),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 33),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.grey,
                                      backgroundImage:
                                          NetworkImage(data.get("img")),
                                      radius: 40,
                                    ),
                                    const SizedBox(width: 30),
                                    Expanded(
                                      child: SizedBox(
                                        child: Text(
                                          data.get("fullName"),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 40),
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
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              side: const BorderSide(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
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
                                          onPressed: () {
                                            DBUser()
                                                .deleteFullProfile(
                                                    uid: widget.post
                                                        .get('id_user'))
                                                .then((value) =>
                                                    Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const UserList())));
                                          },
                                          style: ElevatedButton.styleFrom(
                                            elevation: 0,
                                            backgroundColor: MyColors.red(),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
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
                                      labelPadding: const EdgeInsets.symmetric(
                                          horizontal: 0.1),
                                      labelStyle: GoogleFonts.poppins(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w700),
                                      unselectedLabelColor: MyColors.black(),
                                      labelColor: MyColors.red(),
                                      indicator: const BoxDecoration(
                                          color: Colors.transparent),
                                      tabs: const [
                                        Tab(
                                          iconMargin:
                                              EdgeInsets.only(bottom: 3),
                                          text: 'Profile',
                                          icon: Icon(UgongIcons.profile,
                                              size: 20),
                                        ),
                                        Tab(
                                          iconMargin:
                                              EdgeInsets.only(bottom: 3),
                                          text: 'Education',
                                          icon: Icon(UgongIcons.education,
                                              size: 20),
                                        ),
                                        Tab(
                                          iconMargin:
                                              EdgeInsets.only(bottom: 3),
                                          text: 'Skills',
                                          icon:
                                              Icon(UgongIcons.skill, size: 20),
                                        ),
                                        Tab(
                                          iconMargin:
                                              EdgeInsets.only(bottom: 3),
                                          text: 'Project',
                                          icon: Icon(UgongIcons.project,
                                              size: 20),
                                        ),
                                        Tab(
                                          iconMargin:
                                              EdgeInsets.only(bottom: 3),
                                          text: 'Experience',
                                          icon: Icon(UgongIcons.experience,
                                              size: 20),
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
        });
  }

  Widget tabBarSkills() {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.only(top: 55, bottom: 20, left: 22, right: 22),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: MyColors.lightGrey(),
          ),
        ),
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('user_list')
                .doc(widget.post.get("id_user"))
                .collection("skill")
                .snapshots(),
            builder: (context, snapshots) {
              return (snapshots.connectionState == ConnectionState.waiting)
                  ? const Center()
                  : ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 20),
                      itemCount: snapshots.data?.docs.length,
                      itemBuilder: (context, index) {
                        var data = snapshots.data?.docs[index];
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 13, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    data!['skill'],
                                    style: GoogleFonts.poppins(
                                      color:
                                          const Color.fromARGB(255, 33, 33, 33),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    maxLines: 5,
                                  ),
                                  Text(
                                    data['level'],
                                    style: GoogleFonts.poppins(
                                      color:
                                          const Color.fromARGB(255, 33, 33, 33),
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
                      });
            }),
      ),
    ));
  }

  Widget tabBarEducation() {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.only(top: 55, bottom: 20, left: 22, right: 22),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: MyColors.lightGrey(),
          ),
        ),
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('user_list')
                .doc(widget.post.get("id_user"))
                .collection("education")
                .snapshots(),
            builder: (context, snapshots) {
              return (snapshots.connectionState == ConnectionState.waiting)
                  ? const Center()
                  : ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 20),
                      itemCount: snapshots.data?.docs.length,
                      itemBuilder: (context, index) {
                        var data = snapshots.data?.docs[index];
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 13, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    data!['nameSchool'],
                                    style: GoogleFonts.poppins(
                                      color:
                                          const Color.fromARGB(255, 33, 33, 33),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    maxLines: 5,
                                  ),
                                  Text(
                                    data['startYear'],
                                    style: GoogleFonts.poppins(
                                      color:
                                          const Color.fromARGB(255, 33, 33, 33),
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
                      });
            }),
      ),
    ));
  }

  Widget tabBarProject() {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.only(top: 55, bottom: 20, left: 22, right: 22),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: MyColors.lightGrey(),
          ),
        ),
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('user_list')
                .doc(widget.post.get("id_user"))
                .collection("project")
                .orderBy("projetName", descending: false)
                .snapshots(),
            builder: (context, snapshots) {
              return (snapshots.connectionState == ConnectionState.waiting)
                  ? const Center()
                  : ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 20),
                      itemCount: snapshots.data?.docs.length,
                      itemBuilder: (context, index) {
                        var data = snapshots.data?.docs[index];
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 13, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    data!['projetName'],
                                    style: GoogleFonts.poppins(
                                      color:
                                          const Color.fromARGB(255, 33, 33, 33),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    maxLines: 5,
                                  ),
                                  Text(
                                    data['platform'],
                                    style: GoogleFonts.poppins(
                                      color:
                                          const Color.fromARGB(255, 33, 33, 33),
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
                      });
            }),
      ),
    ));
  }

  Widget tabBarExperience() {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.only(top: 55, bottom: 20, left: 22, right: 22),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: MyColors.lightGrey(),
          ),
        ),
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('user_list')
                .doc(widget.post.get("id_user"))
                .collection("expirence")
                .snapshots(),
            builder: (context, snapshots) {
              return (snapshots.connectionState == ConnectionState.waiting)
                  ? const Center()
                  : ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 20),
                      itemCount: snapshots.data?.docs.length,
                      itemBuilder: (context, index) {
                        var data = snapshots.data?.docs[index];
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 13, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    data!['company'],
                                    style: GoogleFonts.poppins(
                                      color:
                                          const Color.fromARGB(255, 33, 33, 33),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    maxLines: 5,
                                  ),
                                  Text(
                                    data['startYear'],
                                    style: GoogleFonts.poppins(
                                      color:
                                          const Color.fromARGB(255, 33, 33, 33),
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
                      });
            }),
      ),
    ));
  }

  Widget tabBarProfile(DocumentSnapshot<Map<String, dynamic>> data) {
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
                      text: data['age'].toString(),
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
                      text: data['gender'],
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
                      text: data['position'],
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
                      text: data['email'],
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
                      text: data['github'],
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
                      text: data['lamaBerkerja'],
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
}

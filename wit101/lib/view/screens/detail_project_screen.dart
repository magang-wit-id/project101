import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utility/poppins_text.dart';
import '../../utility/warna.dart';

class DetailProjectScreen extends StatefulWidget {
  const DetailProjectScreen({super.key});

  @override
  State<DetailProjectScreen> createState() => _DetailProjectScreenState();
}

class _DetailProjectScreenState extends State<DetailProjectScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: MyColors.black(),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/svg/profile_back_icon.svg'),
          ),
        ),
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
                left: 20,
                top: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    PoppinsText.custom(
                        text: 'React Native',
                        fontSize: 18,
                        warna: Colors.white,
                        fontWeight: FontWeight.w700),
                    PoppinsText.custom(
                        text: 'Project',
                        fontSize: 18,
                        warna: Colors.white,
                        fontWeight: FontWeight.w700),
                  ],
                ),
              ),
              Positioned(
                top: 190,
                bottom: 0,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 15,
                            bottom: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 70),
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: MyColors.lightGrey(), width: 1),
                                    boxShadow: const [
                                      BoxShadow(
                                        offset: Offset(0, 6),
                                        blurRadius: 4,
                                        color:
                                            Color.fromRGBO(203, 203, 203, 0.25),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: TabBar(
                                      labelStyle: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                      unselectedLabelColor:
                                          MyColors.lightGrey(),
                                      indicator: BoxDecoration(
                                        color: MyColors.red(),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      tabs: const [
                                        Tab(
                                          text: 'Report',
                                        ),
                                        Tab(
                                          text: 'Detail',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Expanded(
                                child: TabBarView(
                                  children: [
                                    tabBarReport(),
                                    tabBarDetail(),
                                  ],
                                ),
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
    );
  }
}

Widget rowCustom(String judul, String output) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      PoppinsText.custom(
          text: judul,
          fontSize: 12,
          warna: MyColors.black(),
          fontWeight: FontWeight.w500),
      PoppinsText.custom(
          text: output,
          fontSize: 12,
          warna: MyColors.lightGrey(),
          fontWeight: FontWeight.w500),
    ],
  );
}

Widget tabBarReport() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 22),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PoppinsText.custom(
            text: 'Your Report :',
            fontSize: 16,
            warna: MyColors.black(),
            fontWeight: FontWeight.w600),
        const SizedBox(height: 12),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 65,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border:
                              Border.all(color: MyColors.lightGrey(), width: 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              PoppinsText.custom(
                                  text: 'Project ID',
                                  fontSize: 12,
                                  warna: MyColors.black(),
                                  fontWeight: FontWeight.w500),
                              PoppinsText.custom(
                                  text: 'PID0002',
                                  fontSize: 18,
                                  warna: MyColors.red(),
                                  fontWeight: FontWeight.w600),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Container(
                        height: 65,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border:
                              Border.all(color: MyColors.lightGrey(), width: 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              PoppinsText.custom(
                                  text: 'Status',
                                  fontSize: 12,
                                  warna: MyColors.black(),
                                  fontWeight: FontWeight.w500),
                              PoppinsText.custom(
                                  text: 'Finished',
                                  fontSize: 18,
                                  warna: MyColors.green(),
                                  fontWeight: FontWeight.w600),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: MyColors.lightGrey(), width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(19.0),
                    child: Column(
                      children: [
                        rowCustom('Deal Price', 'Rp. 2.500.000'),
                        const SizedBox(height: 16),
                        rowCustom('Duration (month)', '4'),
                        const SizedBox(height: 16),
                        rowCustom('Workers', '5'),
                        const SizedBox(height: 16),
                        rowCustom('Market Fee (%)', '9%'),
                        const SizedBox(height: 16),
                        rowCustom('Market Fee', 'Rp. 225.000'),
                        const SizedBox(height: 16),
                        rowCustom('Project Start', '08-08-2022'),
                        const SizedBox(height: 16),
                        rowCustom('Project Finish', '28-10-2022'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 41),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: PoppinsText.custom(
                              text: 'Start Project',
                              fontSize: 14,
                              warna: MyColors.yellow(),
                              fontWeight: FontWeight.w600),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(
                                color: MyColors.yellow(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: PoppinsText.custom(
                              text: 'Finish Project',
                              fontSize: 14,
                              warna: MyColors.green(),
                              fontWeight: FontWeight.w600),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(
                                color: MyColors.green(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: PoppinsText.custom(
                        text: 'Delete Project',
                        fontSize: 14,
                        warna: Colors.white,
                        fontWeight: FontWeight.w600),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: MyColors.red(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget tabBarDetail() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 22),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PoppinsText.custom(
            text: 'Uploaded By :',
            fontSize: 16,
            warna: MyColors.black(),
            fontWeight: FontWeight.w600),
        const SizedBox(height: 12),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 65,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border:
                              Border.all(color: MyColors.lightGrey(), width: 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              PoppinsText.custom(
                                  text: 'User ID',
                                  fontSize: 12,
                                  warna: MyColors.black(),
                                  fontWeight: FontWeight.w500),
                              PoppinsText.custom(
                                  text: 'UID0004',
                                  fontSize: 18,
                                  warna: MyColors.red(),
                                  fontWeight: FontWeight.w600),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Container(
                        height: 65,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border:
                              Border.all(color: MyColors.lightGrey(), width: 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              PoppinsText.custom(
                                  text: 'Position',
                                  fontSize: 12,
                                  warna: MyColors.black(),
                                  fontWeight: FontWeight.w500),
                              PoppinsText.custom(
                                  text: 'Market',
                                  fontSize: 18,
                                  warna: MyColors.red(),
                                  fontWeight: FontWeight.w600),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: MyColors.lightGrey(), width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(19.0),
                    child: Column(
                      children: [
                        rowCustom('Username', 'Igbol'),
                        const SizedBox(height: 16),
                        rowCustom('Name', 'Igbol Nunu'),
                        const SizedBox(height: 16),
                        rowCustom('Date', '08-08-2022'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

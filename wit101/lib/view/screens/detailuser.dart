import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wit101/utility/poppins_text.dart';
import 'package:wit101/utility/warna.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailUser extends StatefulWidget {
  final DocumentSnapshot post;
  const DetailUser({super.key, required this.post});

  @override
  State<DetailUser> createState() => _DetailUserState();
}

class _DetailUserState extends State<DetailUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: MyColors.black(),
      appBar: AppBar(
        toolbarHeight: 50,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: SvgPicture.asset('assets/svg/profile_back_icon.svg'),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              left: 0,
              child: Image.asset('assets/png/circle_1.png'),
            ),
            Positioned(
              top: 100,
              bottom: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 57,
                    child: Image.asset('assets/png/profile3.png'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  PoppinsText.custom(
                    text: 'Admin',
                    fontSize: 20,
                    warna: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  PoppinsText.custom(
                    text: 'Admin',
                    fontSize: 12,
                    warna: MyColors.darkGrey(),
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.topCenter,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 60,
                          left: 40,
                          right: 40,
                          bottom: 30,
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: 280,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(0, 1),
                                      blurRadius: 5,
                                      color: Colors.black.withOpacity(0.3),
                                    ),
                                  ],
                                  color: Colors.white),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 10,
                                      left: 20,
                                      right: 10,
                                    ),
                                    child: SvgPicture.asset(
                                        'assets/svg/email_icon.svg'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 10,
                                      right: 10,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        PoppinsText.custom(
                                            text: 'Email',
                                            fontSize: 12,
                                            warna: MyColors.black(),
                                            fontWeight: FontWeight.w600),
                                        PoppinsText.custom(
                                            text: 'Admin',
                                            fontSize: 12,
                                            warna: MyColors.darkGrey(),
                                            fontWeight: FontWeight.w600),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 14),
                            Container(
                              width: 280,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(0, 1),
                                      blurRadius: 5,
                                      color: Colors.black.withOpacity(0.3),
                                    ),
                                  ],
                                  color: Colors.white),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      right: 10,
                                    ),
                                    child: SvgPicture.asset(
                                      'assets/svg/profile_id_icon.svg',
                                      width: 20,
                                      height: 20,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 10,
                                      left: 10,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        PoppinsText.custom(
                                            text: 'User ID',
                                            fontSize: 12,
                                            warna: MyColors.black(),
                                            fontWeight: FontWeight.w600),
                                        PoppinsText.custom(
                                            text: 'Admin',
                                            fontSize: 12,
                                            warna: MyColors.darkGrey(),
                                            fontWeight: FontWeight.w600),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 14),
                            Container(
                              constraints: const BoxConstraints(
                                  minHeight: 40, maxHeight: 80),
                              width: 280,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(0, 1),
                                      blurRadius: 5,
                                      color: Colors.black.withOpacity(0.3),
                                    ),
                                  ],
                                  color: Colors.white),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 10,
                                      left: 20,
                                      right: 10,
                                      bottom: 10,
                                    ),
                                    child: SvgPicture.asset(
                                      'assets/svg/profile_address_icon.svg',
                                      width: 20,
                                      height: 20,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 5,
                                      left: 10,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        PoppinsText.custom(
                                            text: 'Address',
                                            fontSize: 12,
                                            warna: MyColors.black(),
                                            fontWeight: FontWeight.w600),
                                        Container(
                                          constraints: const BoxConstraints(
                                              maxHeight: 66),
                                          width: 172,
                                          child: SingleChildScrollView(
                                            child: Text(
                                              'Admin',
                                              maxLines: 10,
                                              style: GoogleFonts.poppins(
                                                  color: MyColors.darkGrey(),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 14),
                            Container(
                              width: 280,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(0, 1),
                                      blurRadius: 5,
                                      color: Colors.black.withOpacity(0.3),
                                    ),
                                  ],
                                  color: Colors.white),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 12,
                                      left: 22,
                                      right: 10,
                                    ),
                                    child: SvgPicture.asset(
                                        'assets/svg/password_icon.svg'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 5,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        PoppinsText.custom(
                                            text: 'Password',
                                            fontSize: 12,
                                            warna: MyColors.black(),
                                            fontWeight: FontWeight.w600),
                                        PoppinsText.custom(
                                            text: 'Admin',
                                            fontSize: 12,
                                            warna: MyColors.darkGrey(),
                                            fontWeight: FontWeight.w600),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            ElevatedButton(
                              onPressed: () {},
                              child: PoppinsText.custom(
                                  text: 'Delete Account',
                                  fontSize: 12,
                                  warna: Colors.white,
                                  fontWeight: FontWeight.w600),
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                fixedSize: const Size(280, 40),
                                backgroundColor: MyColors.red(),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
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
            Positioned(
              right: 30,
              top: 277,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.red(),
                  shape: const CircleBorder(),
                  fixedSize: const Size(61, 61),
                ),
                child: SvgPicture.asset('assets/svg/profile_edit_icon.svg'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

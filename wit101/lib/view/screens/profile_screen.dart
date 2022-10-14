import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wit101/utility/poppins_text.dart';
import 'package:wit101/utility/warna.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    backgroundColor: Colors.grey,
                    radius: 57,
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
                              width: double.infinity,
                              height: 80,
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
                                      top: 25,
                                      bottom: 25,
                                      left: 27,
                                      right: 24,
                                    ),
                                    child: SvgPicture.asset(
                                        'assets/svg/profile_email_icon.svg'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 19,
                                      bottom: 19,
                                      right: 27,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        PoppinsText.custom(
                                            text: 'Email',
                                            fontSize: 14,
                                            warna: MyColors.black(),
                                            fontWeight: FontWeight.w600),
                                        PoppinsText.custom(
                                            text: 'Admin',
                                            fontSize: 14,
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
                                  minHeight: 80, maxHeight: 125),
                              width: double.infinity,
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
                                      top: 25,
                                      bottom: 25,
                                      left: 27,
                                      right: 24,
                                    ),
                                    child: SvgPicture.asset(
                                        'assets/svg/profile_address_icon.svg'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 19,
                                      bottom: 19,
                                      right: 27,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        PoppinsText.custom(
                                            text: 'Address',
                                            fontSize: 14,
                                            warna: MyColors.black(),
                                            fontWeight: FontWeight.w600),
                                        Container(
                                          constraints: const BoxConstraints(
                                              maxHeight: 66),
                                          width: 172,
                                          child: SingleChildScrollView(
                                            child: Text(
                                              'Jl.dago',
                                              maxLines: 10,
                                              style: GoogleFonts.poppins(
                                                  color: MyColors.darkGrey(),
                                                  fontSize: 14,
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
                              width: double.infinity,
                              height: 80,
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
                                      top: 25,
                                      bottom: 25,
                                      left: 27,
                                      right: 24,
                                    ),
                                    child: SvgPicture.asset(
                                        'assets/svg/profile_id_icon.svg'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 19,
                                      bottom: 19,
                                      right: 27,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        PoppinsText.custom(
                                            text: 'ID',
                                            fontSize: 14,
                                            warna: MyColors.black(),
                                            fontWeight: FontWeight.w600),
                                        PoppinsText.custom(
                                            text: 'UID0001',
                                            fontSize: 14,
                                            warna: MyColors.darkGrey(),
                                            fontWeight: FontWeight.w600),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: double.infinity,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: PoppinsText.custom(
                                    text: 'Change Account',
                                    fontSize: 12,
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

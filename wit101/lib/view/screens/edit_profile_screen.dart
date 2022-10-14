import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wit101/utility/warna.dart';

import '../../utility/poppins_text.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  var controllerID = TextEditingController();
  var controllerEmail = TextEditingController();
  var controllerPass = TextEditingController();
  String? dropdownPick;
  List<String> dropdownList = ['Admin', 'Market', 'Account Management'];
  bool _pwdBool = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.black(),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        title: PoppinsText.custom(
          text: 'Edit Profile',
          fontSize: 16,
          warna: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
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
                right: 0,
                top: 210,
                child: Image.asset('assets/png/circle_3.png'),
              ),
              Positioned(
                top: 100,
                bottom: 0,
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 57,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            right: -17,
                            bottom: -6,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: MyColors.red(),
                                fixedSize: const Size(30, 30),
                                shape: const CircleBorder(),
                              ),
                              child: SvgPicture.asset(
                                  height: 20,
                                  'assets/svg/profile_photo_icon.svg'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
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
                            top: 42,
                            bottom: 34,
                            left: 40,
                            right: 40,
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                profileDisabledTextField('UID0001'),
                                const SizedBox(height: 14),
                                profileTextField(
                                    controller: controllerID,
                                    textInputType: TextInputType.text,
                                    maxLines: 1,
                                    minLines: 1,
                                    hintText: 'entah apa ini'),
                                const SizedBox(height: 14),
                                profileTextField(
                                    controller: controllerEmail,
                                    textInputType: TextInputType.emailAddress,
                                    maxLines: 1,
                                    minLines: 1,
                                    hintText: 'Email'),
                                const SizedBox(height: 14),
                                TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return '*required field';
                                    }
                                    return null;
                                  },
                                  controller: controllerPass,
                                  keyboardType: TextInputType.text,
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: MyColors.black(),
                                    fontWeight: FontWeight.w500,
                                  ),
                                  obscureText: _pwdBool,
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  decoration: InputDecoration(
                                    hintStyle: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: MyColors.lightGrey(),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    hintText: 'Password',
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 11),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _pwdBool = !_pwdBool;
                                        });
                                      },
                                      icon: _pwdBool
                                          ? const Icon(
                                              Icons.visibility,
                                              color: Color(0xFFCBCBCB),
                                              size: 18,
                                            )
                                          : const Icon(
                                              Icons.visibility_off,
                                              color: Color(0xFFCBCBCB),
                                              size: 18,
                                            ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: MyColors.lightGrey(),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: MyColors.black(),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 14),
                                DropdownButtonFormField(
                                  value: dropdownPick,
                                  items: dropdownList.map(
                                    (value) {
                                      return DropdownMenuItem(
                                        value: value,
                                        child: PoppinsText.custom(
                                            text: value,
                                            fontSize: 12,
                                            warna: MyColors.black(),
                                            fontWeight: FontWeight.w500),
                                      );
                                    },
                                  ).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      dropdownPick = value.toString();
                                    });
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                  },
                                  icon: SvgPicture.asset(
                                      'assets/svg/profile_dropdown_icon.svg'),
                                  decoration: InputDecoration(
                                    hintStyle: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: MyColors.lightGrey(),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    hintText: 'Position',
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 11),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: MyColors.lightGrey(),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: MyColors.black(),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: double.infinity,
                                  height: 40,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: PoppinsText.custom(
                                        text: 'Save',
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
                                const SizedBox(height: 14),
                                SizedBox(
                                  width: double.infinity,
                                  height: 40,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: PoppinsText.custom(
                                        text: 'Cancel',
                                        fontSize: 12,
                                        warna: MyColors.black(),
                                        fontWeight: FontWeight.w600),
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      side: BorderSide(color: MyColors.black()),
                                    ),
                                  ),
                                ),
                              ],
                            ),
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

Widget profileTextField({
  required TextEditingController controller,
  required TextInputType textInputType,
  required int maxLines,
  required int minLines,
  required String hintText,
}) {
  return TextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) {
        return '*required field';
      }
      return null;
    },
    controller: controller,
    keyboardType: textInputType,
    maxLines: maxLines,
    minLines: minLines,
    style: GoogleFonts.poppins(
      fontSize: 12,
      color: MyColors.black(),
      fontWeight: FontWeight.w500,
    ),
    decoration: InputDecoration(
      hintStyle: GoogleFonts.poppins(
        fontSize: 12,
        color: MyColors.lightGrey(),
        fontWeight: FontWeight.w500,
      ),
      hintText: hintText,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: MyColors.lightGrey(),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: MyColors.black(),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}

Widget profileDisabledTextField(String textInput) {
  var myController = TextEditingController();
  myController.text = textInput;

  return TextField(
    minLines: 1,
    maxLines: 3,
    controller: myController,
    style: GoogleFonts.poppins(
      color: MyColors.lightGrey(),
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    decoration: InputDecoration(
      enabled: false,
      filled: true,
      fillColor: MyColors.disabledGrey(),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: MyColors.lightGrey(),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
    ),
  );
}

Widget passwordTextField({
  required TextEditingController controller,
  required String hintText,
  required bool pwdVisibility,
}) {
  return TextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) {
        return '*required field';
      }
      return null;
    },
    controller: controller,
    keyboardType: TextInputType.text,
    style: GoogleFonts.poppins(
      fontSize: 12,
      color: MyColors.black(),
      fontWeight: FontWeight.w500,
    ),
    obscureText: pwdVisibility,
    enableSuggestions: false,
    autocorrect: false,
    decoration: InputDecoration(
      hintStyle: GoogleFonts.poppins(
        fontSize: 12,
        color: MyColors.lightGrey(),
        fontWeight: FontWeight.w500,
      ),
      hintText: hintText,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
      suffixIcon: IconButton(
          onPressed: () {},
          icon: pwdVisibility
              ? const Icon(Icons.visibility)
              : const Icon(Icons.visibility_off)),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: MyColors.lightGrey(),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: MyColors.black(),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}

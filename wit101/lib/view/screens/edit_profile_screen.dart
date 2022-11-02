import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wit101/model/model_api/auth_model.dart';
import 'package:wit101/model/view_model/view_model_user.dart';
import 'package:wit101/utility/poppins_text.dart';
import 'package:wit101/utility/warna.dart';
import 'package:wit101/view/screens/profile_screen.dart';

class EditProfileScreen extends StatefulWidget {
  final DocumentSnapshot post;
  const EditProfileScreen({super.key, required this.post});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  var controllerID = TextEditingController();
  var controllerName = TextEditingController();
  var controllerEmail = TextEditingController();
  var controllerAddress = TextEditingController();
  var controllerPass = TextEditingController();

  String? dropdownPick;
  List<String> dropdownList = ['Admin', 'Market', 'Account Management'];
  bool _pwdBool = true;

  File? _photo;
  final ImagePicker _picker = ImagePicker();

  Future imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile();
      } else {
        log('No image selected.');
      }
    });
  }

  Future imgFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile();
      } else {
        log('No image selected.');
      }
    });
  }

  Future uploadFile() async {
    String uuid = controllerID.text = widget.post.get("id_user");
    if (_photo == null) return;

    try {
      final ref = FirebaseStorage.instance.ref('user').child("${uuid}jpg");
      await ref.putFile(_photo!);
      final storageRef = FirebaseStorage.instance.ref('user');
      final imageUrl = await storageRef.child("${uuid}jpg").getDownloadURL();
      FirebaseFirestore.instance
          .collection('bd_userdata')
          .doc(uuid)
          .update({
            'img': imageUrl,
          })
          .then(
            (value) => const SnackBar(content: Text("User Updated")),
          )
          .catchError(
            (error) => SnackBar(content: Text("Failed to update user: $error")),
          );
    } catch (e) {
      log('error occured');
    }
  }

  @override
  void initState() {
    controllerID.text = widget.post.get("id_user");
    controllerName.text = widget.post.get("name");
    controllerEmail.text = widget.post.get("email");
    controllerAddress.text = widget.post.get("alamat");
    controllerPass.text = widget.post.get("password");
    dropdownPick = widget.post.get('role');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var uid = controllerID.text;
    var name = controllerName.text;
    var alamat = controllerAddress.text;
    var role = dropdownPick;

    //cerdenalitas
    var setPassword = widget.post.get("password");

    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('bd_userdata')
            .doc(uid)
            .snapshots(),
        builder: (context, snapshots) {
          var data = snapshots.data;

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
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
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
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          backgroundImage: NetworkImage('${data?['img']}'),
                          radius: 57,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                right: -17,
                                bottom: -6,
                                child: ElevatedButton(
                                  onPressed: () {
                                    _showPicker(context);
                                  },
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
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 42,
                                  left: 40,
                                  bottom: 42,
                                  right: 40,
                                ),
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      profileDisabledTextField(
                                          textInput: widget.post.get("id_user"),
                                          myController: controllerID),
                                      const SizedBox(height: 14),
                                      profileTextField(
                                          controller: controllerName,
                                          textInputType: TextInputType.text,
                                          maxLines: 1,
                                          minLines: 1,
                                          hintText: 'Name'),
                                      const SizedBox(height: 14),
                                      profileTextField(
                                          controller: controllerEmail,
                                          textInputType:
                                              TextInputType.emailAddress,
                                          maxLines: 1,
                                          minLines: 1,
                                          hintText: 'Email'),
                                      const SizedBox(height: 14),
                                      profileTextField(
                                          controller: controllerAddress,
                                          textInputType: TextInputType.text,
                                          maxLines: 1,
                                          minLines: 1,
                                          hintText: 'Address'),
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
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 12, vertical: 11),
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                _pwdBool = !_pwdBool;
                                              });
                                            },
                                            icon: _pwdBool
                                                ? const Icon(
                                                    Icons.visibility_off,
                                                    color: Color(0xFFCBCBCB),
                                                    size: 18,
                                                  )
                                                : const Icon(
                                                    Icons.visibility,
                                                    color: Color(0xFFCBCBCB),
                                                    size: 18,
                                                  ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: MyColors.lightGrey(),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: MyColors.black(),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
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
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 12, vertical: 11),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: MyColors.lightGrey(),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: MyColors.black(),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 60),
                                      SizedBox(
                                        width: double.infinity,
                                        height: 40,
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            Auth()
                                                .userChanges(
                                                    email: controllerEmail.text,
                                                    password: controllerPass.text,
                                                    setPassword: setPassword)
                                                .then((value) => DB_User()
                                                    .updateUser(
                                                        uid: uid,
                                                        name: name,
                                                        email: controllerEmail.text,
                                                        password: controllerPass.text,
                                                        role: role.toString(),
                                                        alamat: alamat))
                                                .whenComplete(() =>
                                                    Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const ProfileScreen())));
                                          },
                                          child: PoppinsText.custom(
                                              text: 'Save',
                                              fontSize: 12,
                                              warna: Colors.white,
                                              fontWeight: FontWeight.w600),
                                          style: ElevatedButton.styleFrom(
                                            elevation: 0,
                                            backgroundColor: MyColors.red(),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
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
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            side: BorderSide(
                                                color: MyColors.black()),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
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
          );
        });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Gallery'),
                    onTap: () {
                      imgFromGallery();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
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

Widget profileDisabledTextField({required textInput, required myController}) {
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:wit101/model/view_model/view_model_user.dart';
import 'package:wit101/utility/poppins_text.dart';
import 'package:wit101/utility/warna.dart';

class StepperExperience extends StatefulWidget {
  final TextEditingController controllerAgency;
  final TextEditingController controllerStartYearExperience;
  final TextEditingController controllerEndYearExperience;
  final TextEditingController controllerAddress;
  final TextEditingController controllerPhone;
  final TextEditingController controllerCompany;
  final TextEditingController controllerPosition;
  final String uidExp;

  const StepperExperience(
      {Key? key,
      required this.controllerAgency,
      required this.controllerStartYearExperience,
      required this.controllerEndYearExperience,
      required this.controllerPhone,
      required this.controllerCompany,
      required this.controllerPosition,
      required this.controllerAddress,
      required this.uidExp})
      : super(key: key);

  @override
  State<StepperExperience> createState() => _StepperExperienceState();
}

class _StepperExperienceState extends State<StepperExperience> {
  //clear
  Future clearText() async {
    widget.controllerAgency.clear();
    widget.controllerStartYearExperience.clear();
    widget.controllerEndYearExperience.clear();
    widget.controllerPhone.clear();
    widget.controllerCompany.clear();
    widget.controllerPosition.clear();
    widget.controllerAddress.clear();
  }

  @override
  Widget build(BuildContext context) {
    DBUser dbUser = Provider.of<DBUser>(context, listen: false);
    dbUser = Provider.of<DBUser>(context);
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 450,
          child: Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('user_list')
                      .doc(widget.uidExp)
                      .collection("expirence")
                      .snapshots(),
                  builder: (context, snapshots) {
                    return (snapshots.connectionState ==
                            ConnectionState.waiting)
                        ? const Center()
                        : ListView.builder(
                            itemCount: snapshots.data?.docs.length,
                            itemBuilder: (context, index) {
                              var data = snapshots.data?.docs[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 8),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 56,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(0.0, 1.0), //(x,y)
                                        blurRadius: 6.0,
                                      ),
                                    ],
                                  ),
                                  child: GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 13),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: SizedBox(
                                              height: 36,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    data?['company'],
                                                    maxLines: 2,
                                                    textAlign: TextAlign.left,
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  Text(
                                                    data?['startYear'] +
                                                        "-" +
                                                        data?['endYear'],
                                                    maxLines: 2,
                                                    textAlign: TextAlign.left,
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          SizedBox(
                                            height: 40,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                dbUser
                                                    .deleteExpirence(
                                                        uid: widget.uidExp,
                                                        newuid: data?[
                                                            'uidExpirence'])
                                                    .then((value) =>
                                                        Fluttertoast.showToast(
                                                            msg:
                                                                "EDUCATION DELETE"));
                                              },
                                              style: ElevatedButton.styleFrom(
                                                elevation: 0,
                                                backgroundColor: MyColors.red(),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                              child: SvgPicture.asset(
                                                  'assets/svg/trash.svg'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                  })),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            width: double.infinity,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                              bottom: 20,
                              left: 20,
                              right: 20,
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0.0, 1.0), //(x,y)
                                    blurRadius: 6.0,
                                  ),
                                ],
                              ),
                              child: SingleChildScrollView(
                                child: SizedBox(
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(top: 14),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 50,
                                          child: TextFormField(
                                            controller: widget.controllerAgency,
                                            decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              hintText: 'Agency',
                                            ),
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                    top: 14),
                                                height: 50,
                                                child: TextFormField(
                                                  controller: widget
                                                      .controllerStartYearExperience,
                                                  decoration: InputDecoration(
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    hintText: 'Start Year',
                                                  ),
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 12),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                    top: 14),
                                                height: 50,
                                                child: TextFormField(
                                                  controller: widget
                                                      .controllerEndYearExperience,
                                                  decoration: InputDecoration(
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    hintText: 'End Year',
                                                  ),
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 12),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(top: 14),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 50,
                                          child: TextFormField(
                                            controller: widget.controllerPhone,
                                            decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              hintText: 'Phone Number',
                                            ),
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(top: 14),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 50,
                                          child: TextFormField(
                                            controller:
                                                widget.controllerAddress,
                                            decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              hintText: 'Address',
                                            ),
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(top: 14),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 50,
                                          child: TextFormField(
                                            controller:
                                                widget.controllerCompany,
                                            decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              hintText: 'Company Type',
                                            ),
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(top: 14),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 50,
                                          child: TextFormField(
                                            controller:
                                                widget.controllerPosition,
                                            decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              hintText: 'Position',
                                            ),
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 140,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 40,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              String newuid = const Uuid().v4();
                                              dbUser
                                                  .addExpirence(
                                                      uid: widget.uidExp,
                                                      newuid: newuid,
                                                      agency: widget.controllerAgency.text,
                                                      startYear: widget.controllerStartYearExperience.text,
                                                      endYear: widget.controllerEndYearExperience.text,
                                                      phoneNumber: widget.controllerPhone.text,
                                                      address: widget.controllerAddress.text,
                                                      company: widget.controllerCompany.text,
                                                      possion: widget.controllerCompany.text)
                                                  .then((value) => clearText())
                                                  .then((value) =>
                                                      Navigator.pop(context))
                                                  .then((value) =>
                                                      Fluttertoast.showToast(
                                                          msg:
                                                              "EDUCATION ADD"));
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: MyColors.red(),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                            child: PoppinsText.custom(
                                              text: 'Save',
                                              fontSize: 14,
                                              warna: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 40,
                                          child: ElevatedButton(
                                            onPressed: () {
                                               clearText().then((value) =>
                                                  Navigator.pop(context));
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                side: BorderSide(
                                                    color: MyColors.black()),
                                              ),
                                            ),
                                            child: PoppinsText.custom(
                                              text: 'Cancel',
                                              fontSize: 14,
                                              warna: MyColors.black(),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      )
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
                );
              },
              child: PoppinsText.custom(
                  text: '+ Add Data',
                  fontSize: 14,
                  warna: MyColors.red(),
                  fontWeight: FontWeight.w500),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                side: BorderSide(color: MyColors.red()),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

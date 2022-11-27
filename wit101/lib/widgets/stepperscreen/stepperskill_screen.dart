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

class StepperSkill extends StatefulWidget {
  final TextEditingController controllerSkill;
  final TextEditingController controllerNote;
  final String uidSkil;

  const StepperSkill(
      {Key? key,
      required this.controllerSkill,
      required this.controllerNote,
      required this.uidSkil})
      : super(key: key);

  @override
  State<StepperSkill> createState() => _StepperSkillState();
}

class _StepperSkillState extends State<StepperSkill> {
  String selectedValue = 'Level';

  var items = ['Level', 'Beginner', 'Intermediate', 'Proficient'];

  Future clearText() async {
    widget.controllerSkill.clear();
    widget.controllerNote.clear();
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
                      .doc(widget.uidSkil)
                      .collection("skill")
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
                                                    data?['skill'],
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
                                                    data?['level'],
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
                                                    .deleteSkill(
                                                        uid: widget.uidSkil,
                                                        newuid:
                                                            data?['uidSkill'])
                                                    .then((value) =>
                                                        Fluttertoast.showToast(
                                                            msg:
                                                                "SKILL DELETE"));
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
                                            controller: widget.controllerSkill,
                                            decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              hintText: 'Skill / Programming',
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
                                          height: 60,
                                          child: dropdownMenu(),
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
                                          height: 120,
                                          child: TextFormField(
                                            controller: widget.controllerNote,
                                            decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              hintText: 'Note',
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
                                              String
                                                  // ignore: non_constant_identifier_names
                                                  Newuid = const Uuid().v4();
                                              dbUser
                                                  .addSkill(
                                                      uid: widget.uidSkil,
                                                      newuid: Newuid,
                                                      skill: widget
                                                          .controllerSkill.text,
                                                      level: selectedValue
                                                          .toString(),
                                                      note: widget
                                                          .controllerNote.text)
                                                  .then((value) => clearText())
                                                  .then((value) =>
                                                      Navigator.pop(context))
                                                  .then((value) =>
                                                      Fluttertoast.showToast(
                                                          msg: "Skill ADD"));
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

  Widget dropdownMenu() {
    return InputDecorator(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            value: selectedValue,
            icon: const Icon(Icons.keyboard_arrow_down),
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: const Color.fromRGBO(156, 156, 156, 1)),
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedValue = newValue!;
              });
            }),
      ),
    );
  }
}

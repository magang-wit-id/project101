import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StepperProfile extends StatefulWidget {
  final TextEditingController controllerFullName;
  final TextEditingController controllerAge;
  final TextEditingController controllerPosition;
  final TextEditingController controllerEmail;
  final TextEditingController controllerJob;
  final TextEditingController controllerGithub;
  final TextEditingController controllerGender;

  const StepperProfile(
      {Key? key,
      required this.controllerFullName,
      required this.controllerAge,
      required this.controllerPosition,
      required this.controllerEmail,
      required this.controllerJob,
      required this.controllerGithub,
      required this.controllerGender})
      : super(key: key);

  @override
  State<StepperProfile> createState() => _StepperProfileState();
}

class _StepperProfileState extends State<StepperProfile> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            margin: const EdgeInsets.only(top: 14),
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: TextFormField(
              controller: widget.controllerFullName,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: 'Full Name',
              ),
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500, fontSize: 12),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            margin: const EdgeInsets.only(top: 14),
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: TextFormField(
              controller: widget.controllerAge,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: 'Age',
              ),
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500, fontSize: 12),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            margin: const EdgeInsets.only(top: 14),
            width: MediaQuery.of(context).size.width,
            height: 60,
            child: TextFormField(
              controller: widget.controllerGender,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: 'Gender',
              ),
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500, fontSize: 12),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            margin: const EdgeInsets.only(top: 14),
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: TextFormField(
              controller: widget.controllerPosition,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: 'Position',
              ),
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500, fontSize: 12),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            margin: const EdgeInsets.only(top: 14),
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: TextFormField(
              controller: widget.controllerEmail,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: 'Email',
              ),
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500, fontSize: 12),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            margin: const EdgeInsets.only(top: 14),
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: TextFormField(
              controller: widget.controllerGithub,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: 'Github',
              ),
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500, fontSize: 12),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            margin: const EdgeInsets.only(top: 14),
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: TextFormField(
              controller: widget.controllerJob,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: 'Lama Bekerja',
              ),
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500, fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }


}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PoppinsText {
  static custom({
    required String text,
    required double fontSize,
    required Color warna,
    required FontWeight fontWeight,
  }) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: warna,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}

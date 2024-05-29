import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wr_project/app/style/app_color.dart';

class TextStyles {
  static TextStyle headerStyle = GoogleFonts.plusJakartaSans(
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );

  static TextStyle headerStyleProfile = GoogleFonts.plusJakartaSans(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static TextStyle headerFieldStyle = GoogleFonts.plusJakartaSans(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  static TextStyle descriptionStyle = GoogleFonts.plusJakartaSans(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static TextStyle fieldLabelStyle = GoogleFonts.plusJakartaSans(
    fontSize: 20,
    color: Colors.black,
  );

  static TextStyle buttonTextStyle = GoogleFonts.plusJakartaSans(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.blue,
  );

  static TextStyle leadsTextStyle = GoogleFonts.plusJakartaSans(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static TextStyle leadsdecTextStyle = GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static TextStyle menuTextStyle = GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static TextStyle generalTextStyle = TextStyle(
    fontSize: 18,
    color: AppColor.txt, // Ensure AppColor is correctly imported and used
  );

  static TextStyle dangerTextStyle = TextStyle(
    fontSize: 18,
    color: AppColor.error, // Make sure AppColor is defined or import it
  );
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color bgColor = Color(0xFFF5FBFF); //Color(0xFFF5FBFF)
const Color buttonColor = Color(0xFF7895B2);
const Color textColor = Colors.black;

const String title = "To Do";

class CustomTextStyle {
  static TextStyle toDoTextStyle = GoogleFonts.poppins(
    color: Colors.black,
    fontSize: 20,
  );

  static TextStyle appBarTitle = GoogleFonts.lato(
      color: Colors.black, fontSize: 50, fontWeight: FontWeight.bold);

  static TextStyle bottomNavBarStyle = GoogleFonts.poppins(
    color: Colors.black,
    fontSize: 12,
  );

  static TextStyle bottomNavBarStyleSelected = GoogleFonts.poppins(
      color: Colors.black, fontSize: 12, fontWeight: FontWeight.w400);

  static TextStyle cardTitlestyle = GoogleFonts.lato(
      color: Colors.red, fontSize: 12, fontWeight: FontWeight.w400);
}

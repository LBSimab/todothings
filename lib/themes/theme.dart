import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


const Color bluclr = Color(0xff4e5ae8);
const Color yelloClr = Color(0xffffb746);
const Color pinkClr = Color(0xFFff4667);
const white = Colors.white;
const primaryColor = bluclr;
const Color darkgrey = Color(0xFF121212);
const Color darkheadClr = Color(0xFF424242);



class Themes{
  static final light = ThemeData(
    primaryColor: Colors.blue,
    brightness: Brightness.light

  );
static final dark=ThemeData(
  primaryColor: darkheadClr,
      brightness: Brightness.dark,
  primaryIconTheme:IconThemeData(color: pinkClr)

);
}

TextStyle get headerStyle{
  return GoogleFonts.lato(
     textStyle: TextStyle(
       fontWeight: FontWeight.bold,
       fontSize: 25,

     )
  );
}



TextStyle get subHeaderStyle{
  return GoogleFonts.acme(
      textStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,

      )
  );
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';


const Color bluclr = Color(0xff4e5ae8);
const Color dateback = Color(0xaa6cbd81);
const Color yelloClr = Color(0xffffb746);
const Color pinkClr = Color(0xFFff4667);
const white = Colors.white;
const primaryColor = bluclr;
const Color darkgrey = Color(0xFF121212);
const Color darkheadClr = Color(0xFF424242);



class Themes{
  static final light = ThemeData(
    primaryColor: Colors.blue,
    brightness: Brightness.light,
    cardColor: Colors.blueGrey[900]

  );
static final dark=ThemeData(
  primaryColor: darkheadClr,
      brightness: Brightness.dark,
  primaryIconTheme:IconThemeData(color: pinkClr),


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
TextStyle get titleStyle{
  return GoogleFonts.lato(
    textStyle:TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w800,
      color: Get.isDarkMode?Colors.white:Colors.black
    )
  );
}


TextStyle get subTitleStyle{
  return GoogleFonts.lato(
      textStyle:TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Get.isDarkMode?Colors.grey[100]:Colors.grey[600]
      )
  );
}


TextStyle get descriptionStyle{
  return GoogleFonts.lato(
      textStyle:TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w800,
          color: Get.isDarkMode?Colors.white:Colors.black,
          letterSpacing: 1,
        wordSpacing: 1,
      )
  );



}


TextStyle get bottomnavigationStyle{
  return GoogleFonts.lato(
      textStyle:TextStyle(
        fontSize: 15,
fontWeight: FontWeight.bold,
        color: Get.isDarkMode?Colors.white:Colors.black,
        letterSpacing: 1,
        wordSpacing: 1,
      )
  );}
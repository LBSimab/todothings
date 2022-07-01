import 'package:flutter/material.dart';


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
      brightness: Brightness.dark
);
}
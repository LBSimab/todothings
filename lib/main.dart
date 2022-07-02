import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/View/mainview.dart';
import 'package:to_do_list/themes/theme.dart';
void main() {
  runApp( MyApp());
}



class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: Themes.light,
      debugShowCheckedModeBanner: false,
      darkTheme: Themes.dark
        ,
      home: mainPage()
    );
  }
}

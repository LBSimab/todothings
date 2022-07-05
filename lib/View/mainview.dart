import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list/controllers/mainController.dart';
import 'package:to_do_list/themes/theme.dart';
import 'package:get/get.dart';
import 'package:to_do_list/widgets/button.dart';

import '../themes/theme_services.dart';

class MainView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:_appBar(),
      body:Column(
        children: [
          _addTaskbar(),
          SizedBox(height: 10,),
          Container(
            child: DatePicker(
              DateTime.now(),
              height: 100,
              width: 80,
              initialSelectedDate: DateTime.now(),
              selectionColor: primaryColor,
            ),
          ),

        ],
      ) ,
    );
  }
}

_addTaskbar(){
  return Container(
    padding: const EdgeInsets.only(left:20,right:20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(

          child: Column(


            crossAxisAlignment: CrossAxisAlignment.start

            ,children: [
            Text(DateFormat.yMMMMd().format(DateTime.now()),
              style: headerStyle,

            ),
            SizedBox(height: 15),
            Text('Today',style: subHeaderStyle,)

          ],),
        ),
        myButton(label: "+ AddTask", onTap: ()=>null),

      ],
    ),
  );
}


_appBar(){
  return  AppBar(elevation: 0,leading: GestureDetector(
      child: Icon(Get.isDarkMode ? Icons.wb_sunny_sharp:Icons.nightlight_round,
          color:Get.isDarkMode ? Colors.yellow:Colors.white  ),
      onTap:(){
        ThemeServices().switchTheme();
        GetBuilderState<mainController>;

      }
  ),
    actions: [CircleAvatar(backgroundImage: AssetImage('images/download.jpg'),),SizedBox(width: 15,)],
  );
}
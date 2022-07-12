import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:intl/intl.dart';
import 'package:to_do_list/View/addTask.dart';
import 'package:to_do_list/controllers/addpageController.dart';
import 'package:to_do_list/controllers/mainController.dart';
import 'package:to_do_list/themes/theme.dart';
import 'package:get/get.dart';
import 'package:to_do_list/widgets/button.dart';
import 'package:to_do_list/widgets/task_tile.dart';

import '../themes/theme_services.dart';

class MainView extends StatefulWidget {



  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
    final _taskController = Get.put(TaskController());
double progressValue = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:_appBar(),
      body:Column(
        children: [
          _addTaskbar(),
          SizedBox(height: 10,),
          _addDateBar(context),
          _showTask(context),




        ],
      ) ,
    );



  }

    _showTask(BuildContext context){
      return Expanded(
        child: Obx((){
          return ListView.builder(
              itemCount: _taskController.taskList.length,

              itemBuilder: (_,index){
                print(_taskController.taskList.length);
                return Row(
                  children: [
                    GestureDetector(
                      onTap: (){},
                      child: TaskTile(_taskController.taskList[index]),
                    )
                  ],
                );
              }


          );
        }),
      );
    }
}

_addTaskbar(){
  return Container(
    padding: const EdgeInsets.only(left:30,right:30),
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
        myButton(label: "+ AddTask", onTap: ()=>Get.to(addTask())),

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


      }
  ),
    actions: [GestureDetector(child: CircleAvatar(backgroundImage: AssetImage('images/download.jpg'),),onTap:(){
      print('y chizi');
    },),SizedBox(width: 15,)],

  );
}

_addDateBar(BuildContext context){
  return Center(
    child: Container(
      decoration: BoxDecoration(color: Get.isDarkMode?context.theme.primaryColor:context.theme.primaryColor ,borderRadius: BorderRadius.circular(10)),
      child: DatePicker(

        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor:Get.isDarkMode?dateback:Color(0xA1710345)   ,
        selectedTextColor: Get.isDarkMode ? Colors.black :Colors.white
        ,

        dateTextStyle: GoogleFonts.lato(textStyle: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold,fontSize: 25)),
        dayTextStyle:GoogleFonts.lato(textStyle: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black)) ,
        monthTextStyle: GoogleFonts.lato(textStyle: TextStyle(color: Get.isDarkMode? Colors.white:Colors.black)),

      ),

    ),
  );
}



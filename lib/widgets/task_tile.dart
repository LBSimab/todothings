
import 'package:flutter/material.dart';


import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';



import '../models/task_model.dart';
import '../themes/theme.dart';
class TaskTile extends StatelessWidget {
  final Task? task;
  TaskTile(this.task);

  @override
  Widget build(BuildContext context) {
    return
       Container(
        padding:
        EdgeInsets.symmetric(horizontal: 20),
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(bottom: 12),
        child: Container(
          padding: EdgeInsets.only(top: 15,bottom: 15,right: 30,left: 15),
          //  width: SizeConfig.screenWidth * 0.78,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: _getBGClr(task?.color??0),
          ),
          child: Row(children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task?.title??"",
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Get.isDarkMode? Colors.black:Colors.grey[100]),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ), Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.access_time_rounded,
                        color: Get.isDarkMode? Colors.black:Colors.grey[100],
                        size: 18,
                      ),
                      SizedBox(width: 4),
                      Text(
                        "${task!.startTime} - ${task!.endTime}",
                        style: GoogleFonts.lato(
                          textStyle:
                          TextStyle(fontSize: 15, color:Get.isDarkMode? Colors.black:Colors.grey[100]),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 3,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.calendar_today_sharp,
                        color: Get.isDarkMode? Colors.black:Colors.grey[100],
                        size: 18,
                      ),
                      SizedBox(width: 4),
                      Text(
                        "${task!.startDate} - ${task!.endDate}",
                        style: GoogleFonts.lato(
                          textStyle:
                          TextStyle(fontSize: 15, color: Get.isDarkMode? Colors.black:Colors.grey[100]),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  GestureDetector(
                    onTap: (){
                      _showBottomSheet(context,task!,_getBGClr(task?.color??0));
                    },
                    child: Text(
                      "description",
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w700,color:Get.isDarkMode? Colors.black:Colors.grey[100]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
Text(task!.category.toString(),style: TextStyle(decoration: TextDecoration.underline,color: Get.isDarkMode? Colors.black:Colors.grey[100]),),
          SizedBox(width: 40,),
           CircularPercentIndicator(lineWidth: 6,curve: Curves.elasticIn,radius: 30  ,progressColor: Colors.cyan,percent: 0.1 ,backgroundColor: Get.isDarkMode?Colors.indigo:Colors.blueGrey.shade400,)



          ]),
        ),
      );

  }

  _getBGClr(int no) {
    switch (no) {
      case 0:
        return bluclr;
      case 1:
        return pinkClr;
      case 2:
        return yelloClr;
      default:
        return bluclr;
    }
  }
  
  
  
}_showBottomSheet(BuildContext context,Task task,Color bgcolor){
  Get.bottomSheet(exitBottomSheetDuration: Duration(milliseconds: 300) ,Container(
    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
    height:MediaQuery.of(context).size.height*0.20,

   decoration: BoxDecoration(
       color: context.theme.backgroundColor,
        borderRadius: BorderRadius.circular(20)


   ),
    child:


    Center(

      child: Container(
        height: 100,
        width: 350  ,
        decoration: BoxDecoration(

            color: Get.isDarkMode?Colors.blueGrey:Colors.white,
            borderRadius: BorderRadius.circular(15),
          border: Border.all(color: bgcolor,width: 5)
        ),
        child:
           Center(
            child: Text(
              task!.description.toString(),
              style: descriptionStyle,
            ),
          ),
        ),
      ),
    ),

  );
}
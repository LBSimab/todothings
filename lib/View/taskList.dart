import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:to_do_list/db/Db_helper.dart';
import '../controllers/mainController.dart';
import '../themes/theme.dart';
import '../widgets/task_tile.dart';

class taskList extends StatelessWidget {

  final _mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        _addTaskbar(),
        SizedBox(height: 10,),
        _addDateBar(context),
        _showTask(context),




      ],
    ) ;
  }

  _showTask(BuildContext context){
    return Expanded(
      child: Obx((){
        return ListView.builder(
            itemCount: _mainController.taskList.length,

            itemBuilder: (_,index){

              return  AnimationConfiguration.staggeredList(
                position: index,
                child: SlideAnimation(
                  child: FadeInAnimation(
                    duration: Duration(milliseconds: 300),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: (){

                          },
                          child: TaskTile(_mainController.taskList[index]),
                        )
                      ],
                    ),
                  ),
                ),
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Today',style: subHeaderStyle,),
                SizedBox(width: 42,),
                Text(DateFormat.yMMMMd().format(DateTime.now()),
                  style: headerStyle,

                ),

              ],
            ),



          ],),
        ),


      ],
    ),
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
        selectionColor:Get.isDarkMode?Color(0xFF007282):Color(0xFF00E2FF)  ,
        selectedTextColor: Get.isDarkMode ? Colors.black :Colors.white
        ,

        dateTextStyle: GoogleFonts.lato(textStyle: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold,fontSize: 25)),
        dayTextStyle:GoogleFonts.lato(textStyle: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black)) ,
        monthTextStyle: GoogleFonts.lato(textStyle: TextStyle(color: Get.isDarkMode? Colors.white:Colors.black)),

      ),

    ),
  );
}






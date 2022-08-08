
import 'package:flutter/material.dart';


import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:to_do_list/widgets/updateInputField.dart';



import '../controllers/addpageController.dart';
import '../controllers/mainController.dart';
import '../models/task_model.dart';
import '../models/user_model.dart';
import '../themes/theme.dart';
import 'button.dart';
import 'input_field.dart';
class mgTaskTile extends StatefulWidget {
  final Task? task;
  mgTaskTile(this.task);

  @override
  State<mgTaskTile> createState() => _mgTaskTileState();
}

class _mgTaskTileState extends State<mgTaskTile> {
  final TextEditingController titlecontroller = TextEditingController();

  final TextEditingController descrcontroller = TextEditingController();

  DateTime startDate = DateTime.now();

  DateTime endDate = DateTime.now();

  String endTime="9:30 PM";

  String startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();

  int selectedstep=5;

  final  _taskController = Get.put(TaskController());

  final  mainController = Get.put(MainController());

  List<int> stepList=[
    5,
    10,
    15,

  ];

  String selectedcategory="None";

  List<String> categoryList=[
    "DataBase",
    "BackEnd",
    "FrontEnd",
    "Phone App"
  ];

  int selectedcolor=0;

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
            color: _getBGClr(widget.task?.color??0),
          ),
          child: Row(children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.task?.title??"",
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
                        "${widget.task!.startTime} - ${widget.task!.endTime}",
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
                        "${widget.task!.startDate} - ${widget.task!.endDate}",
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
                      _showBottomSheet(context,widget.task!,_getBGClr(widget.task?.color??0),);
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
            Text(widget.task!.category.toString(),style: TextStyle(decoration: TextDecoration.underline,color: Get.isDarkMode? Colors.black:Colors.grey[100]),),
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

  _showBottomSheet(BuildContext context,Task task,Color bgcolor,){

    Get.bottomSheet(




      persistent: false,
      exitBottomSheetDuration: Duration(milliseconds: 300) ,
           Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        height:MediaQuery.of(context).size.height*0.95,

        decoration: BoxDecoration(
            color: context.theme.backgroundColor,
            borderRadius: BorderRadius.circular(20)


        ),
        child:


        Container(
          padding: const EdgeInsets.only(left:20,right:20),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 3),
            child: Column(
              children: [
                Text('Add Task',style: headerStyle,),
                SizedBox(height: 10,),
                MyInputField(title: '   Title', hint: '  put title here',controller: titlecontroller,),
                MyInputField(title: '   description', hint: '  put description here',controller: descrcontroller,),


                MyInputField(title: "Steps", hint: "$selectedstep  ",
                  widget: DropdownButton(
                    icon:Icon(Icons.keyboard_arrow_down_sharp,),
                    iconSize: 20,
                    elevation: 4,
                    style: subTitleStyle,
                    items: stepList.map<DropdownMenuItem<String>>((int value){
                      return DropdownMenuItem<String>(
                        value: value.toString(),
                        child:Text(value.toString()),
                      );
                    }).toList(),
                    onChanged:(String? newValue){
                      setState((){
                        selectedstep=int.parse(newValue!);
                      });
                    } ,
                  ),


                ),
                MyInputField(title: "Category", hint:  selectedcategory,
                  widget: DropdownButton(
                    icon:Icon(Icons.keyboard_arrow_down_sharp,),
                    iconSize: 20,
                    elevation: 4,
                    style: subTitleStyle,
                    items: categoryList.map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem<String>(
                        value: value.toString(),
                        child:Text(value.toString()),
                      );
                    }).toList(),
                    onChanged:(String? newValue){
                      setState((){
                        selectedcategory=newValue!;
                      });
                    } ,
                  ),


                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    myButton(label: "Delete", onTap:(){ mainController.DeleteTask(task);mainController.getTasks();Get.back();}),
                    myButton(label: "Update Task", onTap: (){validateDate(task);
                    ;mainController.getTasks();Get.back();mainController.update(mainController.searchlist);})
                  ]

                  ,)




              ]


              ,

            ),
          ),
        ),
    ),


    );



  }
  _addToDB(Task task) async {
    int value =  await mainController.UpdateTask(
         Task(
          title: titlecontroller.text,
          color: task.color ,
          category: task.category,
          endDate: task.endDate,
          description: descrcontroller.text,
          endTime: task.endTime,
          startDate: task.startDate,
          startTime: task.startTime,
          steps: selectedstep,
          step: 0,
          id: task.id
        )
    );
    print('my id is '+"$value");
    print(endDate.toString());
  }

  validateDate(Task task){
    if(titlecontroller.text.isNotEmpty&&descrcontroller.text.isNotEmpty){
      _addToDB(task);
      Get.back();
      mainController.getTasks();

    }else if (titlecontroller.text.isEmpty&&descrcontroller.text.isEmpty){
      Get.snackbar("Required", "All Fields Are Required"
        ,snackPosition: SnackPosition.BOTTOM,
        icon: Icon(Icons.warning_amber_sharp,color: Colors.red,),
        borderRadius: 20,
        backgroundColor: context.theme.backgroundColor,
      );
    }
  }
}
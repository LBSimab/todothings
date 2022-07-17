
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list/controllers/addpageController.dart';
import 'package:to_do_list/themes/theme.dart';
import 'package:to_do_list/widgets/button.dart';
import 'package:to_do_list/widgets/input_field.dart';

import '../models/task_model.dart';



class addTask extends StatefulWidget {
  const addTask({Key? key}) : super(key: key);

  @override
  State<addTask> createState() => _addTaskState();
}

class _addTaskState extends State<addTask> {
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController descrcontroller = TextEditingController();
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  String endTime="9:30 PM";
  String startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  int selectedstep=5;
  final  _taskController = Get.put(TaskController());
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
    return Scaffold(
      appBar: _addappbar(),
      body: Container(
        padding: const EdgeInsets.only(left:20,right:20),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 3),
          child: Column(
            children: [
              Text('Add Task',style: headerStyle,),
              SizedBox(height: 10,),
              MyInputField(title: '   Title', hint: '  put title here',controller: titlecontroller,),
              MyInputField(title: '   description', hint: '  put description here',controller: descrcontroller,),
              Row(
                children: [
                  Expanded(
                    child: MyInputField(title: "StartDate", hint:"   " + DateFormat.yMd().format(startDate),
                    widget: IconButton(
                      onPressed: (){
                        _getDateFromUser(context);
                      },
                      icon: Icon(Icons.calendar_today_sharp),
                    ),

                    ),
                  ), Expanded(
                    child: MyInputField(title: "DeadLine", hint:"   " + DateFormat.yMd().format(endDate),
                      widget: IconButton(
                        onPressed: (){
                          _getDeadLineFromUser(context);
                        },
                        icon: Icon(Icons.calendar_today_sharp),
                      ),

                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: MyInputField(
                        title: "StartTime",
                        hint:  startTime,
                        widget:IconButton(
                          onPressed: (){
                            _getTimeFromUser(context, isStartTime: true);
                          },
                          icon: Icon(Icons.access_time_rounded),
                        ),
                      )
                  ),
                  Expanded(
                      child: MyInputField(
                        title: "EndTime",
                        hint:  endTime,
                        widget:IconButton(
                          onPressed: (){
                        _getTimeFromUser(context, isStartTime: false);
                          },
                          icon: Icon(Icons.access_time_rounded),
                        ),
                      )
                  )
                ],
              ),
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
                _colorPallet(),
                myButton(label: "Create Task", onTap: (){validateDate();
               })
              ]
                
                ,)




            ]


          ,

          ),
        ),
      ),
    );

  }
  _addToDB() async {
 int value =  await _taskController.addTask(
      task: Task(
        title: titlecontroller.text,
color: selectedcolor,
        category: selectedcategory,
        endDate: DateFormat.yMd().format(endDate),
        description: descrcontroller.text,
        endTime: endTime,
        startDate: DateFormat.yMd().format(startDate),
        startTime: startTime,
        steps: selectedstep,
        step: 0,
      )
    );
 print('my id is '+"$value");
 print(endDate.toString());
   }

  validateDate(){
    if(titlecontroller.text.isNotEmpty&&descrcontroller.text.isNotEmpty){
      _addToDB();
      Get.back();
    }else if (titlecontroller.text.isEmpty&&descrcontroller.text.isEmpty){
      Get.snackbar("Required", "All Fields Are Required"
      ,snackPosition: SnackPosition.BOTTOM,
        icon: Icon(Icons.warning_amber_sharp,color: Colors.red,),
        borderRadius: 20,
      backgroundColor: context.theme.backgroundColor,
      );
    }
  }
  _getDateFromUser(BuildContext context)async{
    DateTime? _pickerDate = await showDatePicker(
        context: context, initialDate: DateTime.now(), firstDate: DateTime(2019), lastDate: DateTime(2050));

    if(_pickerDate!=null){
     setState((){
       startDate = _pickerDate;
       print(startDate);

     });

    }else{
      print("something went wrong");
    }

  }



  _getDeadLineFromUser(BuildContext context)async{
    DateTime? _DeadLineDate = await showDatePicker(
        context: context, initialDate: DateTime.now(), firstDate: DateTime(2019), lastDate: DateTime(2050));

    if(_DeadLineDate!=null){
      setState((){
        endDate = _DeadLineDate;
        print(endDate);

      });

    }else{
      print("something went wrong");
    }

  }

    _colorPallet(){
    return Column(

      children: [Text(style: titleStyle,'Color'),
        SizedBox(height: 8,),
        Wrap(children:
        List<Widget>.generate(
            3, (int index){

          return GestureDetector(
            onTap: (){
              setState((){
                selectedcolor=index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: CircleAvatar(
                radius: 16,

                backgroundColor: index==0?primaryColor:index==1?pinkClr:yelloClr,
                child: selectedcolor==index?Icon(Icons.done,size: 16,):Container(),

              ),
            ),
          );
        }


        )

          ,)
      ],
    );
    }
  _getTimeFromUser(BuildContext conext ,{required bool isStartTime})async{

    var  pickedTime = await _showTimePicker();
    String _formatedTime = pickedTime.format(conext);
    if(pickedTime==null){
      print("time has been canceled");
    }
    else if(isStartTime==true){
      setState((){
        startTime = _formatedTime;
      });
    }
    else if (isStartTime==false){
     setState((){
       endTime=_formatedTime;
     });
    }
  }
  _showTimePicker( ){
    return showTimePicker(context: context, initialTime: TimeOfDay(
        hour: int.parse(startTime.split(":")[0]),
        minute: int.parse(startTime.split(":")[1].split(" ")[0])
    ));
  }


}
_addappbar(){
  return  AppBar(elevation: 0,leading: GestureDetector(
      child: Icon(Icons.arrow_back_rounded),
      onTap:(){
        Get.back();


      }
  ),
    actions: [CircleAvatar(backgroundImage: AssetImage('images/download.jpg'),),SizedBox(width: 15,)],
  );
}

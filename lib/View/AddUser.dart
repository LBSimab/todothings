
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list/controllers/addpageController.dart';
import 'package:to_do_list/controllers/mainController.dart';
import 'package:to_do_list/models/user_model.dart';
import 'package:to_do_list/themes/theme.dart';
import 'package:to_do_list/widgets/button.dart';
import 'package:to_do_list/widgets/input_field.dart';

import '../models/task_model.dart';



class addUser extends StatefulWidget {
  const addUser({Key? key}) : super(key: key);

  @override
  State<addUser> createState() => _adduserState();
}

class _adduserState extends State<addUser> {
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController descrcontroller = TextEditingController();
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  String endTime="9:30 PM";
  String startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  int selectedstep=5;
  final  _taskController = Get.put(TaskController());
  final  _mainController = Get.put(MainController());
  List<int> stepList=[
    0,
    5,
    10,

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
              Text('Add User',style: headerStyle,),
              SizedBox(height: 10,),
              MyInputField(title: '   Name', hint: '  put title here',controller: titlecontroller,),
              MyInputField(title: '   Alias', hint: '  put description here',controller: descrcontroller,),
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
                  ),
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

                  myButton(label: "Create User", onTap: (){validateDate();
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
    int value =  await _taskController.addUser(
        user: User(
          about: descrcontroller.text,
          alias: titlecontroller.text,
          name: titlecontroller.text,
          commits: selectedstep,
          role: selectedcategory,
          category: selectedcategory,

          startDate: DateFormat.yMd().format(startDate),

        )
    );
    print('user id is '+"$value");


  }

  validateDate(){
    if(titlecontroller.text.isNotEmpty&&descrcontroller.text.isNotEmpty){
      _addToDB();
      Get.back();
      _mainController.getUsers();

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

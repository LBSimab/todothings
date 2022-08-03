
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../controllers/addpageController.dart';
import '../models/task_model.dart';
import '../themes/theme.dart';
import '../widgets/button.dart';
import '../widgets/input_field.dart';

class ProfileView extends StatefulWidget {
   ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {


  final TextEditingController aboutme = TextEditingController();

  final TextEditingController namecontroller = TextEditingController();

  final TextEditingController aliascontroller = TextEditingController();
  final TextEditingController rolecontroller = TextEditingController();

  final TextEditingController joindatecontroller = TextEditingController();
  final TextEditingController commitscontroller = TextEditingController();
final _taskController = Get.put(TaskController());

  String selectedcategory="None";

  List<String> categoryList=[
    "DataBase",
    "BackEnd",
    "FrontEnd",
    "Phone App"
  ];




  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left:20,right:20),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 5),
        child: Column(
          children: [
            SizedBox(height: 10,),

              CircleAvatar(radius: 50,child: Icon(Icons.account_circle,size:   100),),
            Divider(),
            Row(
              children: [

                Expanded(child: MyInputField(title: '   Name', hint: '  put Name here',controller: namecontroller,)),
                SizedBox(width: 7,),
                Expanded(child: MyInputField(title: '   Alias', hint: '  put your Alternate Name here',controller: aliascontroller,),)

              ],
            ),
            Row(
              children: [
                Expanded(child: MyInputField(title: 'commits', hint: ' this a track of commits',controller: commitscontroller,)),
                SizedBox(width: 7,),
                Expanded(child: MyInputField(title: 'joine date', hint: 'put the date that you joined us  ',controller: joindatecontroller,),)

              ],
            ),
            Row(

              children: [
                Expanded(child: MyInputField(title: '   role', hint: '  put Role here',controller: rolecontroller,)),
                SizedBox(width: 7,),
                Expanded(child: MyInputField(title: '   aboutme', hint: '  write something about yourself',controller: aboutme,),)

              ],
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                myButton(label: "Profile Security", onTap: (){validateDate();})
                ,
                myButton(label: "Edit", onTap: (){validateDate();})
              ]

              ,)




          ]


          ,

        ),
      ),
    );
  }
  _addToDB() async {
    int value =  await _taskController.addTask(
        task: Task(
          title: namecontroller.text,
          color: 0,
          category: selectedcategory,
          endDate: DateFormat.yMd().format(DateTime.now()),
          description: aboutme.text,
          endTime: "endTime",
          startDate: DateFormat.yMd().format(DateTime.now()),
          startTime: "startTime",
          steps: 5,
          step: 0,
        )
    );
    print('my id is '+"$value");

  }validateDate(){
    if(aliascontroller.text.isNotEmpty&&namecontroller.text.isNotEmpty){
      _addToDB();
      Get.back();
    }else if (aliascontroller.text.isEmpty&&namecontroller.text.isEmpty){
      Get.snackbar("Required", "All Fields Are Required"
        ,snackPosition: SnackPosition.BOTTOM,
        icon: Icon(Icons.warning_amber_sharp,color: Colors.red,),
        borderRadius: 20,
        backgroundColor: context.theme.backgroundColor,
      );
    }
  }
}


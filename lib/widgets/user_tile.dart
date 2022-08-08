


import 'package:flutter/material.dart';


import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:to_do_list/controllers/mainController.dart';
import 'package:to_do_list/widgets/input_field.dart';
import 'package:to_do_list/widgets/updateInputField.dart';




import '../models/user_model.dart';
import '../themes/theme.dart';
import 'button.dart';
class userTile extends StatefulWidget {
  final User? user;
  userTile(this.user);

  @override
  State<userTile> createState() => _userTileState();
}

class _userTileState extends State<userTile> {
  final _mainController = Get.put(MainController());

  final TextEditingController nameController  = TextEditingController();

  final TextEditingController categoryController  = TextEditingController();

  final TextEditingController roleController  = TextEditingController();

  final TextEditingController aliasController  = TextEditingController();

  final TextEditingController aboutController  = TextEditingController();

  final TextEditingController commitController  = TextEditingController();
   DateTime? startDate= DateTime.now();

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
            color:_getBGClr(widget.user!.category.toString()),
          ),
          child: Row(children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 CircleAvatar(child: _getcategoryicon(widget.user!.category.toString()),radius: 30,),
                  Text(
                    widget.user?.name??"",
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Get.isDarkMode? Colors.black:Colors.grey[100]),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  )
                  ,
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
                        "${widget.user?.startDate} ",
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
                      _showBottomSheet(context,widget.user!,Colors.redAccent);
                    },
                    child: Text(
                      "MANAGE USER",
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.w700,color:Get.isDarkMode? Colors.black:Colors.grey[100]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(widget.user!.role.toString(),style: TextStyle(decoration: TextDecoration.underline,color: Get.isDarkMode? Colors.black:Colors.grey[100]),),
            SizedBox(width: 40,),




          ]),
        ),
      );

  }

  _getBGClr(String no) {
    switch (no) {

      case "DataBase":
        return pinkClr;
      case "BackEnd":
        return yelloClr;
      case "FrontEnd":
        return bluclr;
      case "Phone App":
        return Colors.blueGrey[800];
      default:
        return Colors.black;


    }
  }

  _getcategoryicon(String no) {
    switch (no) {

      case "DataBase":
        return Icon(Icons.dataset_rounded,size: 47,);
      case "BackEnd":
        return Icon(Icons.engineering,size: 47,);
      case "FrontEnd":
        return Icon(Icons.web,size: 47);
      case "Phone App":
        return Icon(Icons.phone_android,size:47,);
      default:
        return Icon(Icons.dangerous,size: 60,color: Colors.red,);


    }
  }

  _showBottomSheet(BuildContext context,User user,Color bgcolor){
    nameController.text=user.name!;
    aliasController.text=user.alias!;
    categoryController.text=user.category!;
    roleController.text=user.role!;
   aboutController.text =user.about!;
    commitController.text=user.commits!.toString();





    Get.bottomSheet(exitBottomSheetDuration: Duration(milliseconds: 200) ,Container(
        padding: EdgeInsets.fromLTRB(15,10, 10, 15),
        height:MediaQuery.of(context).size.height*0.50,

        decoration: BoxDecoration(
            color: context.theme.backgroundColor,
            borderRadius: BorderRadius.circular(20)


        ),
        child:


        SingleChildScrollView(
          child: Column(

            children: [
              Row(
                children: [
                  Expanded(child: UpdateInputField(title: "  Name",controller:nameController,)),
                  SizedBox(width: 5,),
                  Expanded(child: UpdateInputField(title: "  Alias",controller:aliasController,)),
                ],
              ),

              Row(
                children: [
                  Expanded(child: UpdateInputField(title: "  Role",controller:roleController,)),
                  Expanded(child: UpdateInputField(title: "  Category",controller:categoryController,)),
                ],
              ),

              UpdateInputField(title: "  About",controller:aboutController,),
              SizedBox(height: 7,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  myButton(label: "Delete",onTap:(){
                    _mainController.DeleteUser(user);
                    Get.back();
                    _mainController.getUsers();
                  } ,),


                  myButton(label: "Update",onTap:(){
                    validateDate(context, user);
                    _mainController.getUsers();
                  } ,)
                ],
              ),


            ],
          ),
        )
    ),

    );
  }

  _addToDB(User user) async {
    int value =  await _mainController.UpdateUser(User(
      name: nameController.text,
          startDate:DateFormat.yMd().format(startDate!),
      category: categoryController.text,
      about: aboutController.text,
      alias: aliasController.text,
      commits: 5,
      id: user.id,
      role: roleController.text


    )

    );

  }

  validateDate(BuildContext context,User user){
    if(nameController.text.isNotEmpty&&aliasController.text.isNotEmpty){
      _addToDB(user);
      Get.back();
      _mainController.getUsers();

    }else if (nameController.text.isEmpty&&aliasController.text.isEmpty){
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
}
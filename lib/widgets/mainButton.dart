import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:to_do_list/controllers/mainController.dart';
import 'package:to_do_list/themes/theme.dart';

class mainButton extends StatelessWidget {
  final _mainController = Get.put(MainController());
  final String label;

  final Function()? onLong;

   mainButton({Key? key,required this.label,this.onLong}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        Obx(
            ()=> MaterialButton(


       splashColor: Get.isDarkMode?Color(0xFF007282):Color(0xFF00E2FF),
            child:  Text(label,style: bottomnavigationStyle,),

          minWidth: 70 ,
            height: 80,



      color: Get.isDarkMode?(_mainController.tabIndex.value==0?context.theme.primaryColor:Colors.grey):(_mainController.tabIndex.value==0?context.theme.primaryColor:Colors.blueGrey[600]),
            onPressed: (){
          _mainController.ChangeTabIndex(0);
            },
          onLongPress: onLong,
          shape:CircleBorder(),



    ),
        );
  }
}

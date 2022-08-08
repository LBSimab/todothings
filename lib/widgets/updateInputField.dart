import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/themes/theme.dart';

class UpdateInputField extends StatelessWidget {


  final String title;
  final String? hint;
  final TextEditingController? controller;
  final Widget? widget;
  final String? value;


  const UpdateInputField({Key? key,  this.value,this.widget, this.controller,required this.title, this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container
      (
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: titleStyle,),
          Container(

            child: Row(
              children: [
                Expanded(child:TextFormField(initialValue: value,
                  readOnly: widget==null?false:true,
                  autofocus: false,
                  cursorColor: Get.isDarkMode?Colors.grey[100]:Colors.grey[700],
                  controller: controller,
                  style: subTitleStyle,
                  decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: subTitleStyle,
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color:context.theme.backgroundColor,
                          width:3,

                        ),

                      )
                  ),


                ) ,),
                widget == null ?Container():Container(child:widget)

              ],
            ),





            height: 52,

            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),

                border: Border.all(
                  color:Colors.grey,
                  width: 1.0,

                )
            ),

          )

        ],
      ),
    );
  }
}

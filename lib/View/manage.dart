import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:to_do_list/View/AddUser.dart';
import 'package:to_do_list/controllers/mainController.dart';
import 'package:to_do_list/themes/theme.dart';
import 'package:to_do_list/widgets/button.dart';
import 'package:get/get.dart';

import '../widgets/mg_task_tile.dart';
import '../widgets/user_tile.dart';

class ManageView extends StatelessWidget {
   ManageView({Key? key}) : super(key: key);
final _maincontroller = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Center(child: Text(style: headerStyle,"User ManageMent"),

        heightFactor: 2,),
        myButton(onTap: ()=> Get.to(addUser()),label: "Add User",),
        SizedBox(height: 6,),
        Obx(() => _showUser(context)),

        
        
      ],
    );
  }



  _showUser(BuildContext context){
    return Expanded(
        child:
        ListView.builder(
            itemCount: _maincontroller.userList.length,

            itemBuilder: (_,index){
              print(_maincontroller.userList.length);
              return  AnimationConfiguration.staggeredList(
                position: index,
                child: SlideAnimation(
                  child: FadeInAnimation(
                    duration: Duration(milliseconds: 300),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            print(index.toString()   + "Tapped");
                          },
                          child: userTile(_maincontroller.userList[index]),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }


        ));
  }
}

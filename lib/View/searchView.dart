import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:to_do_list/View/taskList.dart';

import 'package:to_do_list/controllers/mainController.dart';
import 'package:get/get.dart';
import 'package:to_do_list/themes/theme.dart';


import '../widgets/mg_task_tile.dart';
class searchView extends StatefulWidget {
  const searchView({Key? key}) : super(key: key);

  @override
  State<searchView> createState() => _searchViewState();
}

class _searchViewState extends State<searchView> {

final TextEditingController searchedtitle=TextEditingController();
  final _maincontroller = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          Container(
            margin:EdgeInsets.all(6) ,

            child: TextField(
              controller: searchedtitle,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintStyle: headerStyle,
                hintText: "Search",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: context.theme.primaryColor),

                )
              ),

            ),
          ),


          SizedBox(height: 3,),

          Obx(()=>_showTask(context)),




        ],
      );

  }
  _showTask(BuildContext context){
    return Expanded(
      child:
         ListView.builder(
            itemCount: _maincontroller.taskList.length,

            itemBuilder: (_,index){
              print(_maincontroller.taskList.length);
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
                          child: mgTaskTile(_maincontroller.taskList[index]),
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





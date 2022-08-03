import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:intl/intl.dart';
import 'package:to_do_list/View/addTask.dart';

import 'package:to_do_list/View/manage.dart';
import 'package:to_do_list/View/profile.dart';
import 'package:to_do_list/View/searchView.dart';
import 'package:to_do_list/View/taskList.dart';


import 'package:to_do_list/controllers/mainController.dart';
import 'package:to_do_list/themes/theme.dart';
import 'package:get/get.dart';

import 'package:to_do_list/widgets/mainButton.dart';
import 'package:to_do_list/widgets/task_tile.dart';

import '../themes/theme_services.dart';

class MainView extends StatefulWidget {



  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final _mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    _appBar() {
      return AppBar(elevation: 0, leading: GestureDetector(
          child: Icon(
              Get.isDarkMode ? Icons.wb_sunny_sharp : Icons.nightlight_round,
              color: Get.isDarkMode ? Colors.yellow : Colors.white),
          onTap: () {
            ThemeServices().switchTheme();
            _mainController.getTasks();
            _mainController.getUsers();

          }
      ),
        actions: [
          GestureDetector(child: CircleAvatar(
            backgroundImage: AssetImage('images/download.jpg'),), onTap: () {
            _mainController.ChangeTabIndex(3);

          },),
          SizedBox(width: 15,)
        ],

      );
    };
    return Scaffold(
      appBar: _appBar(),
      body: Obx(()=>
         IndexedStack(
          index: _mainController.tabIndex.toInt(),
          children: [
            taskList(),
            ManageView(),
            searchView(),
            ProfileView()

          ],

        ),
      ),
      floatingActionButton: mainButton(
        label: "Tasks", onLong: () => Get.to(addTask()),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


      bottomNavigationBar:
      Obx(
            () =>
            BottomAppBar(shape: CircularNotchedRectangle(),
              color: context.theme.backgroundColor,


              notchMargin: 5,
              child: Container(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MaterialButton(
                          child: Icon(Icons.list_alt_outlined,size:35,),
                          minWidth: 50,
                          height: 40,
                          color: _mainController.tabIndex == 2 ? context.theme
                              .primaryColor : context.theme.disabledColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onPressed: () {
                            _mainController.ChangeTabIndex(2);
                          }),

                      MaterialButton(
                        child: Icon(Icons.manage_accounts, size: 35,),
                        height: 40,
                        minWidth: 50,

                        onPressed: () {
                          _mainController.ChangeTabIndex(1);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: _mainController.tabIndex == 1 ? context.theme
                            .primaryColor : context.theme.disabledColor,)
                    ],

                  ),
                ),


              ),
            ),
      ),


    );
  }
}

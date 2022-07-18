import 'package:get/get.dart';

import '../db/Db_helper.dart';
import '../models/task_model.dart';

  class MainController extends GetxController{
  @override
  void OnReady(){
    super.onReady();


  }

var taskList = <Task>[].obs;
var tabIndex = 3.obs;
 void ChangeTabIndex(int index){
  tabIndex.value=index;


  update();
  print(tabIndex.value);




}

void getTasks() async {
  List<Map<String,  dynamic>> tasks = await DBHelper.query();
  taskList.assignAll(tasks.map((data) => new Task.fromJson(data)).toList());
}

}
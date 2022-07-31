import 'package:get/get.dart';

import '../db/Db_helper.dart';
import '../models/task_model.dart';

  class MainController extends GetxController{
    @override
    void onInit(){

      super.onInit();
      getTasks();


    }
  @override
  void OnReady(){
    super.onReady();
    update(taskList);

  }

    var taskList = <Task>[].obs;
  var searchlist=<Task>[].obs;
var tabIndex = 0.obs;
 void ChangeTabIndex(int index){
  tabIndex.value=index;


  update();
  print(tabIndex.value);




}

 getTasks() async {
  List<Map<String,dynamic>> tasks = await DBHelper.query();
  taskList.assignAll(tasks.map((data) => new Task.fromJson(data)).toList());
}

    initsearchval() async {
      List<Map<String,dynamic>> tasks = await DBHelper.query();
      taskList.assignAll(tasks.map((data) => new Task.fromJson(data)).toList());
    }
filtertask(String name){
   List<Task> results=[];
   if(name.isNotEmpty){results = taskList.where((element) => element.title!.toLowerCase().contains(name.toLowerCase())).toList();


   }
    else{

     results=taskList.value;
   }

    print(results.map((e) => e.category));
   searchlist.value=results;
}
}
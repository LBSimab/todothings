import 'package:get/get.dart';

import '../db/Db_helper.dart';
import '../models/task_model.dart';
import '../models/user_model.dart';

  class MainController extends GetxController{
    @override
    void onInit(){

      super.onInit();
      getTasks();
      getUsers();


    }
  @override
  void OnReady(){
    super.onReady();
    update(taskList);

  }
var userList = <User>[].obs;
    var taskList = <Task>[].obs;
  var searchlist=<Task>[].obs;
var tabIndex = 3.obs;
 void ChangeTabIndex(int index){
  tabIndex.value=index;


  update();
  print(tabIndex.value);




}

 getTasks() async {
  List<Map<String,dynamic>> tasks = await DBHelper.query();
  taskList.assignAll(tasks.map((data) => new Task.fromJson(data)).toList());
}

    getUsers() async {
      List<Map<String,dynamic>> userz = await DBHelper.userquery();
      userList.assignAll(userz.map((data) => new User.fromJson(data)).toList());
    }
filtertask(String name){
   List<Task> results=[];
   if(name.isNotEmpty){results = taskList.where((element) => element.title!.toLowerCase().contains(name.toLowerCase())).toList();


   }
    else{

     results=[];
   }

    print(results.map((e) => e.category));
   searchlist.value=results;
}
}
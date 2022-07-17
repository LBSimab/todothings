import 'package:get/get.dart';
import 'package:to_do_list/db/Db_helper.dart';

import '../models/task_model.dart';

class TaskController  extends GetxController{
  @override
  void OnReady(){
    super.onReady();


  }



  Future<int>addTask({Task? task}) async {
    return await DBHelper.insert(task!);
  }



}
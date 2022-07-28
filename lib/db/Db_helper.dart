import 'package:sqflite/sqflite.dart';

import '../models/task_model.dart';

class DBHelper {
  static Database? _db;
  static final int version=1;
  static final String _tasktable="task";
  static Future<void>initD()async{
    if(_db!=null){return;}
    try{
      String _path = await getDatabasesPath()+'tasks.db';
      _db = await openDatabase(_path,version: version,onCreate: (db,version){
        print('Creating tables One');
        return db.execute(
          "CREATE TABLE $_tasktable("
              "ID INTEGER PRIMARY KEY AUTOINCREMENT, "
              "title STRING , description TEXT,"
              "startDate STRING , endDate STRING,"
              "startTime STRING,endTime STRING,"
              "steps INTEGER , category STRING,"
              "color INTEGER,step INTEGER,"
              "JoinedUID INTEGER )",

        );


      });




        ;}catch(e){
      print(e);
    }

  }
  static Future<int> insert(Task task)async{
    print("insert Called");
    return await _db?.insert(_tasktable, task.toJson())??1;

  }
  static Future<List<Map<String , dynamic>>> query() async{
    print('query called');
    return await _db!.query(_tasktable);

  }

}
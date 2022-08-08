import 'package:sqflite/sqflite.dart';

import '../models/task_model.dart';
import '../models/user_model.dart';

class DBHelper {
  static Database? _db;
  static final int version=1;
  static final String _tasktable="task";
  static final String _usertable="usertable";
  static Future<void>initD()async{
    if(_db!=null){return;}
    try{
      String _path = await getDatabasesPath()+'tasks.db';
      _db = await openDatabase(_path,version: version,onCreate: (db,version){
        print('Creating tables ');

          db.execute(
            "CREATE TABLE $_usertable("
                "ID INTEGER PRIMARY KEY AUTOINCREMENT, "
                "name STRING , alias STRING,"
                "joinedDate STRING, "
                "commits INTEGER,"
                "role STRING , category STRING,"

                "about TEXT )",
          );


          db.execute(
          "CREATE TABLE $_tasktable("
              "ID INTEGER PRIMARY KEY AUTOINCREMENT, "
              "title STRING , description TEXT,"
              "startDate STRING , endDate STRING,"
              "startTime STRING,endTime STRING,"
              "reminder STRING , category STRING,"
              "color INTEGER,done INTEGER,"
              "JoinedUID INTEGER )"



        );


      });




        ;}catch(e){
      print(e);
    }

  }

  static Future<int> insertUser(User user)async{
    print("User insert Called");
    return await _db?.insert(_usertable, user.toJson())??1;

  }

  static Future<int> insertTask(Task task)async{
    print("insert Called");
    return await _db?.insert(_tasktable, task.toJson())??1;

  }
  static Future<List<Map<String , dynamic>>> query() async{
    print('query called');
    return await _db!.query(_tasktable);

  }



  static Future<List<Map<String , dynamic>>> userquery() async{
    print('user query called');
    return await _db!.query(_usertable);

  }

  static  deleteTask(Task task)async{
    print("delsseteCalled");
    return  await _db!.delete(_tasktable, where: 'id=?', whereArgs: [task.id]);

  }
  static  deleteUser(User user)async {
    print("delsseteCalled");
    return await _db!.delete(_usertable, where: 'id=?', whereArgs: [user.id]);
  }

  static  updateUser(User user)async {
    print("delsseteCalled");
    return await _db!.update(_usertable,user.toJson() ,where: 'id=?', whereArgs: [user.id]);
  }
  static  updateTask(Task task)async {
    print("delsseteCalled");
    return await _db!.update(_tasktable,task.toJson() ,where: 'id=?', whereArgs: [task.id]);
  }



}
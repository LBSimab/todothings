import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:to_do_list/View/mainview.dart';
import 'package:to_do_list/controllers/mainController.dart';
import 'package:to_do_list/db/Db_helper.dart';
import 'package:to_do_list/themes/theme.dart';
import 'package:to_do_list/themes/theme.dart';
import 'package:to_do_list/themes/theme_services.dart';



Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();

DBHelper.initD();
  await GetStorage.init();
  runApp( MyApp());
}



class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      themeMode: ThemeServices().theme,
      title: 'Flutter Demo',
      theme: Themes.light,
      debugShowCheckedModeBanner: false,
      darkTheme: Themes.dark,


      home: MainView()
    );
  }
}

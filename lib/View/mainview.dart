import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../themes/theme_services.dart';

class mainPage extends StatelessWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: GestureDetector(
        child: Icon(CupertinoIcons.lightbulb_fill,),
        onTap:(){
ThemeServices().switchTheme();
        }
      ),
        actions: [Icon(Icons.person),SizedBox(width: 15,)],
      )
    );
  }
}

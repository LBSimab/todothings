import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/themes/theme.dart';

class myButton extends StatelessWidget {
  final String label;
  final Function()? onTap;

  const myButton({Key? key,required this.label,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 130,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: primaryColor
        ),
        child: Center(
          child: Text(
              label,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),

    );
  }
}

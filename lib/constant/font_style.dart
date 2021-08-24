import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


// This class will have all the color constant which are using in the App.
class AppFontStyle {


  static TextStyle textFiledNormal({Color color = Colors.black}) {
    return TextStyle(
        color: color,
        fontFamily: 'Rubik',
        fontSize: 15.0,
        fontWeight: FontWeight.normal
    );
  }

  static const customAlertTitle = TextStyle(
      color: Colors.black,
      fontFamily: 'Rubik',
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none,
  );
}
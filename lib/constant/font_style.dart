import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'color_constant.dart';

// This class will have all the color constant which are using in the App.

const fontFamilyRubik = 'Rubik';

TextStyle textFiledNormal({Color color = Colors.black}) {
  return TextStyle(
      color: color,
      fontFamily: fontFamilyRubik,
      fontSize: 15.0,
      fontWeight: FontWeight.normal);
}

const customAlertTitle = TextStyle(
  color: Colors.black,
  fontFamily: fontFamilyRubik,
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  decoration: TextDecoration.none,
);

const headerText = TextStyle(
  color: AppColors.white,
  fontSize: 48.0,
  fontFamily: fontFamilyRubik,
  fontWeight: FontWeight.w500,
);

const subHeaderText = TextStyle(
  color: AppColors.BAB9C1,
  fontSize: 17.0,
  fontFamily: fontFamilyRubik,
  fontWeight: FontWeight.normal,
);

const textWhite500_24 = TextStyle(
  color: AppColors.white,
  fontSize: 24.0,
  fontFamily: fontFamilyRubik,
  fontWeight: FontWeight.normal,
);

const drawerListStyle = TextStyle(
    fontFamily: fontFamilyRubik,
    color: AppColors.white,
    fontSize: 16,
    fontWeight: FontWeight.normal);

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'color_constant.dart';

// This class will have all the color constant which are using in the App.

const fontFamilyRubik = 'Rubik';
const fontFamilyRoom = 'Room';
const fontFamilyTrapper = 'Trapper';

TextStyle textFiledNormal({Color color = Colors.black}) {
  return TextStyle(
    color: color,
    fontFamily: fontFamilyRubik,
    fontSize: 15.0,
    fontWeight: FontWeight.normal,
  );
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
  color: AppColors.silver,
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

const drawerListText = TextStyle(
  fontFamily: fontFamilyRubik,
  color: AppColors.white,
  fontSize: 16,
  fontWeight: FontWeight.normal,
);

const customReportTitle = TextStyle(
  color: Colors.white,
  fontFamily: fontFamilyRubik,
  fontSize: 20.0,
  fontWeight: FontWeight.w500,
  decoration: TextDecoration.none,
);

const customDropDownTitle = TextStyle(
  color: Colors.white,
  fontFamily: fontFamilyRubik,
  fontSize: 16.0,
  fontWeight: FontWeight.w400,
  decoration: TextDecoration.none,
);

const percentageStyle = TextStyle(
  color: Colors.white,
  fontFamily: fontFamilyRubik,
  fontSize: 25.0,
  fontWeight: FontWeight.w400,
  decoration: TextDecoration.none,
);

const percentageIconStyle = TextStyle(
  color: Colors.white,
  fontFamily: fontFamilyRubik,
  fontSize: 15.0,
  fontWeight: FontWeight.w400,
  decoration: TextDecoration.none,
);

const doughnutDataStyle = TextStyle(
  color: Colors.white,
  fontFamily: fontFamilyRubik,
  fontSize: 17.0,
  fontWeight: FontWeight.w400,
  decoration: TextDecoration.none,
);

const topActivitiesDetailsTitleStyle = TextStyle(
  color: Colors.white,
  fontFamily: fontFamilyRubik,
  fontSize: 14.0,
  fontWeight: FontWeight.w400,
  decoration: TextDecoration.none,
);
const creditCardNumberText = TextStyle(
  color: AppColors.white,
  fontFamily: fontFamilyTrapper,
  fontSize: 18.0,
  fontWeight: FontWeight.w500,
  letterSpacing: 5,
);

const creditCardNameText = TextStyle(
  color: AppColors.white,
  fontFamily: fontFamilyRoom,
  fontSize: 15.0,
  fontWeight: FontWeight.w500,
);

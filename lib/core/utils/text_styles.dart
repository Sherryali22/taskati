import 'package:flutter/material.dart';
import 'package:taskati/core/constans/app_fonts.dart';
import 'package:taskati/core/utils/colors.dart';

// ignore: non_constant_identifier_names
TextStyle GetTitleTextStyles({double? fontSize ,Color?color ,FontWeight?fontweight}) {
  return TextStyle(
      fontFamily: AppFonts.poppins ,
      fontSize: fontSize ?? 18,
      fontWeight:fontweight?? FontWeight.bold,
      color:color?? AppColors.darkBlueColor);
}
// ignore: non_constant_identifier_names
TextStyle GetbodyTextStyles({double? fontSize ,Color?color ,FontWeight?fontweight}) {
  return TextStyle(
      fontFamily: AppFonts.poppins ,
      fontSize: fontSize ?? 16,
      fontWeight:fontweight?? FontWeight.bold,
      color:color?? AppColors.darkBlueColor);
}
// ignore: non_constant_identifier_names
TextStyle GetSmallTextStyles({double? fontSize ,Color?color ,FontWeight?fontweight}) {
  return TextStyle(
      fontFamily: AppFonts.poppins , 
      fontSize: fontSize ?? 14,
      fontWeight:fontweight?? FontWeight.normal,
      color:color?? AppColors.greyColor);
}

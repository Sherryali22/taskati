import 'package:flutter/material.dart';
import 'package:taskati/core/utils/colors.dart';

// ignore: non_constant_identifier_names
ShowErrorDailogs(BuildContext context ,String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: AppColors.redColor,
    content: Text(message),
  ));
}

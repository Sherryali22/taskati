import 'package:flutter/material.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';

class customButton extends StatelessWidget {
  const customButton(
      {super.key,
      this.bgcolor,
      this.height = 45,
      this.width = 250,
      this.textcolor,
      required this.text,
      required this.onPressed,

      
      });

  final double width;
  final double height;
  final Color? bgcolor;
  final String text;
  final Color? textcolor;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: bgcolor ?? AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed:onPressed,
            child: Text(
              text,
              style:
                  GetbodyTextStyles(color: textcolor ?? AppColors.whiteColor),
            )));
  }
}

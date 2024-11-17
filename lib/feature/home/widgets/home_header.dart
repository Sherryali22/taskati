import 'package:flutter/material.dart';
import 'package:taskati/core/functions/navigation.dart';
import 'package:taskati/core/services/app_local_storange.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/feature/profile/profile_screen.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello  Sherry,${AppLocalStorange.getCacheData(AppLocalStorange.nameKey)}', 
            style: GetTitleTextStyles(color: AppColors.primaryColor,fontSize: 16)),
            Text('have a nice day',
             style: GetbodyTextStyles(),
            ),
          ],
        ),
        const Spacer(),
         GestureDetector(
          onTap: () {
            pushTo(context, const ProfileScreen());
          },
            child : CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(
           AppLocalStorange.getCacheData(AppLocalStorange.imageKey)),))
                
      ]
         );
     
  }
}
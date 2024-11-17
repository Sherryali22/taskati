import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';

class taskitem extends StatelessWidget {
  const taskitem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.primaryColor),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Flutter task 1',
                  style: GetbodyTextStyles(
                      fontSize: 16,
                      color: AppColors.whiteColor),
                ),
                const Gap(5),
                Row(children: [
                  const Icon(Icons.watch_later_outlined,
                      size: 20,
                      color: AppColors.whiteColor),
                  Gap(5),
                  Text(
                    '10:00 AM :11:00 AM',
                    style: GetSmallTextStyles(
                        color: AppColors.whiteColor),
                  ),
                ]),
                const Gap(10),
                Text(
                  'Flutter task 1',
                  style: GetbodyTextStyles(
                      fontSize: 16,
                      color: AppColors.whiteColor),
                ),
              ],
            ),
          ),
          Container(
            width: 1,
            height: 60,
            color: AppColors.whiteColor,
          ),
          RotatedBox(
            quarterTurns:3,
            child: Text(
              '1000',
              style: GetbodyTextStyles(
                  color: AppColors.whiteColor,
                  fontweight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}

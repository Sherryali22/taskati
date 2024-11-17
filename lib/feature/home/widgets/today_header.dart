import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/functions/navigation.dart';
import 'package:taskati/core/services/app_local_storange.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/core/widgets/custom_button.dart';
import 'package:taskati/feature/add_task/add_task_screen.dart';

class TodayHeader extends StatelessWidget {
  const TodayHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(DateFormat.yMMMMd().format(DateTime.now()),
                style: GetTitleTextStyles(
                    color: AppColors.primaryColor, fontSize: 16)),
            Text(
              'Today',
              style: GetTitleTextStyles(fontSize: 16),
            ),
          ],
        ),
        const Spacer(),
        customButton(
            width: 135,
            text: 'add task',
            onPressed: () {
              pushTo(context, AddTaskScreen());
            })
      ],
    );
  }
}

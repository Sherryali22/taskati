//import 'dart:math';
import 'dart:developer';

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/feature/home/widgets/home_header.dart';
import 'package:taskati/feature/home/widgets/taskitem.dart';
import 'package:taskati/feature/home/widgets/today_header.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const HomeHeader(),
              const Gap(15),
              const TodayHeader(),
              const Gap(15),
              DatePicker(
                width: 80,
                height: 180,
                DateTime.now(),
                initialSelectedDate:
                    DateTime.now().subtract(const Duration(days: 2)),
                selectionColor: AppColors.primaryColor,
                selectedTextColor: Colors.white,
                onDateChange: (date) {},
              ),
              const Gap(15),
              Expanded(
                  child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Dismissible(
                            key: UniqueKey(),
                            secondaryBackground: GestureDetector(
                              onTap: () {},
                              child: Container(
                                margin: const EdgeInsets.only(
                                    bottom: 10, left: 5, right: 5),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: AppColors.redColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.delete,
                                      color: AppColors.whiteColor,
                                    ),
                                    Gap(10),
                                    Text(
                                      'delete',
                                      style: GetbodyTextStyles(
                                          color: AppColors.whiteColor),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            background: Container(
                              margin: const EdgeInsets.only(
                                  bottom: 10, left: 5, right: 5),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Icon(
                                    Icons.check,
                                    color: AppColors.whiteColor,
                                  ),
                                  const Gap(10),
                                  Text(
                                    'compalete',
                                    style: GetbodyTextStyles(
                                        color: AppColors.whiteColor),
                                  )
                                ],
                              ),
                            ),
                            onDismissed: (Duration) {
                              if (Duration == DismissDirection.startToEnd) {
                                log('compalete');
                              } else {
                                log('delete');
                              }
                            },
                            child: const taskitem());
                      }))
            ],
          ),
        ),
      ),
    );
  }
}

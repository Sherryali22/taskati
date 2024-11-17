import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/constans/dailogs.dart';
import 'package:taskati/core/functions/navigation.dart';
import 'package:taskati/core/services/app_local_storange.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/core/widgets/custom_button.dart';
import 'package:taskati/feature/home/page/home_view.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreen();
}

class _UploadScreen extends State<UploadScreen> {
  String? path;
  String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () async {
                if (path == null && name.isEmpty) {
                  ShowErrorDailogs(
                      context, 'please enter your name and upload image');
                } else if (path == null && name.isNotEmpty) {
                  ShowErrorDailogs(context, 'please upload image');
                } else if (path != null && name.isEmpty) {
                  ShowErrorDailogs(context, 'please enter your name ');
                } else {
                  AppLocalStorange.cacheData(AppLocalStorange.nameKey,name);
                  AppLocalStorange.cacheData(AppLocalStorange.imageKey,path);
                  AppLocalStorange.cacheData(AppLocalStorange.isUploadKey,true);

                pushWithReplacement(context, const HomeView());
                }
              },
              child: Text(
                'done',
                style: GetbodyTextStyles(color: AppColors.whiteColor),
              )),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 70,
                backgroundColor: AppColors.primaryColor,
                backgroundImage: path != null
                    ? AssetImage(path!)
                    : const AssetImage('assets/images/user.png'),
              ),
              const Gap(20),
              customButton(
                onPressed: () async {
                  await ImagePicker().pickImage(source: ImageSource.camera);
                },
                text: 'Upload from camira',
              ),
              const Gap(20),
              customButton(
                onPressed: () async {
                  await ImagePicker()
                      .pickImage(source: ImageSource.gallery)
                      .then((value) {
                    if (value != null) {
                      setState(() {
                        path = value.path;
                      });
                    }
                  });
                },
                text: 'Upload from galary',
              ),
              const Gap(30),
              const Divider(
                color: AppColors.primaryColor,
                indent: 20,
                endIndent: 20,
              ),
              const Gap(30),
              TextField(
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  helperStyle: GetSmallTextStyles(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
  
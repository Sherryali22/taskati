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
import 'package:taskati/feature/upload/upload_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  String? path;
  String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      backgroundColor: AppColors.whiteColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              customButton(
                                width: double.infinity,
                                onPressed: () async {
                                  await ImagePicker()
                                      .pickImage(source: ImageSource.camera);
                                },
                                text: 'Upload from camira',
                              ),
                            ],
                          ),
                        );
                      });
                },
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundColor: AppColors.primaryColor,
                      backgroundImage: AssetImage(AppLocalStorange.getCacheData(
                          AppLocalStorange.imageKey)),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.whiteColor,
                            ),
                            child: const Icon(Icons.camera_alt)))
                  ],
                ),
              ),
              const Gap(20),
              const Gap(30),
              const Divider(
                color: AppColors.primaryColor,
                indent: 20,
                endIndent: 20,
              ),
              const Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}

UploadScreen({required bool isCamera}) async {
  await ImagePicker()
      .pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery)
      .then((Value) {
    if (Value != null) {
      AppLocalStorange.cacheData(AppLocalStorange.imageKey, Value.path);
      setState() {
      }

     
    }
  });
}

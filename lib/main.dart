import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskati/core/services/app_local_storange.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/feature/intro/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('user');
  await AppLocalStorange.init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.whiteColor,
           titleTextStyle:GetTitleTextStyles(
            color: AppColors.whiteColor
           )
        ) ,
        inputDecorationTheme: InputDecorationTheme(
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
            borderSide: const BorderSide(color: AppColors.redColor),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.redColor),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

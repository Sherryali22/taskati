import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/functions/navigation.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/feature/upload/upload_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {

   // ignore: use_build_context_synchronously
   pushWithReplacement (context,const UploadScreen());

 } 
  );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/images/logo.json', width: 250),
            Text(
              'Taskati',
              style: GetTitleTextStyles(),      

            ),
            const Gap(10),
            Text(
              'It\'s time to get organized',
              style: GetSmallTextStyles(),
            ),
          ],
        ),
      ),
    );
  }
}

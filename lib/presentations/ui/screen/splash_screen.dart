import 'package:crafty_bay/presentations/state_holder/user_auth_controller.dart';
import 'package:crafty_bay/presentations/ui/screen/home_screen.dart';
import 'package:crafty_bay/presentations/ui/screen/main_bottom_navbar_screen.dart';
import 'package:crafty_bay/presentations/ui/screen/product_details_screen.dart';
import 'package:crafty_bay/presentations/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 4));
    await UserAuthController.getUserToken();
         Get.offAll(() => const MainBottomNavBarScreen());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(),
            AppLogo(),
            Spacer(),
            CircularProgressIndicator(),
            SizedBox(height: 18,),
            Text('Version 1.0'),
            SizedBox(height: 18,),
          ],
        ),
      ),
    );
  }
}

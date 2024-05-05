import 'package:crafty_bay/presentations/ui/screen/splash_screen.dart';
import 'package:crafty_bay/presentations/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      title: 'CraftyBay',
      home: const SplashScreen(),
      theme: ThemeData(
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColors.primaryColor,
        ),
        textTheme: _textTheme(),
        inputDecorationTheme: _inputDecorationTheme(),
        elevatedButtonTheme: _elevatedButtonThemeData(),
      ),
    );
  }
  TextTheme _textTheme() => const TextTheme(
    titleLarge: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.3,
    ),
    displaySmall: TextStyle(
      fontSize: 14,
      color: Colors.black54,
    ),
  );
  InputDecorationTheme _inputDecorationTheme() => InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
    hintStyle: const TextStyle(
      color: Colors.grey,
      letterSpacing: 0.3,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Colors.grey,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Colors.grey,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: AppColors.primaryColor,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Colors.red,
      ),
    ),

  );
  ElevatedButtonThemeData _elevatedButtonThemeData() => ElevatedButtonThemeData(
  style:  ElevatedButton.styleFrom(
  fixedSize: const Size.fromWidth(double.maxFinite),
  padding: const EdgeInsets.all(14),
  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(8)
  ),
    backgroundColor: AppColors.primaryColor,
    foregroundColor: Colors.white,
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    )
  ),
  );
}

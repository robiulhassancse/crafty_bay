import 'package:crafty_bay/presentations/ui/screen/complete_profile_screen.dart';
import 'package:crafty_bay/presentations/ui/utility/app_colors.dart';
import 'package:crafty_bay/presentations/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {

  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 40,),
                const AppLogo(),
                const SizedBox(height: 24,),
                Text('Enter OTP Code',style: textTheme.titleLarge,),
                const SizedBox(height: 4,),
                Text('A 4 Digit OTP Code has been Sent',style: textTheme.displaySmall,),
                const SizedBox(height: 16,),
                PinCodeTextField(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 50,
                    activeFillColor: Colors.white,
                    activeColor: AppColors.primaryColor,
                    selectedColor: Colors.red,
                    selectedFillColor: Colors.white,
                    inactiveColor: AppColors.primaryColor,
                    inactiveFillColor: Colors.white,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  controller: textEditingController,
                  onCompleted: (v) {},
                  appContext: context,
                ),
                const SizedBox(height: 16,),
                ElevatedButton(
                  onPressed: () {
                    // Get.to(()=>const CompleteProfileScreen());
                    Get.to(()=>const CompleteProfileScreen());
                  },
                  child: const Text('Next'),
                ),
                const SizedBox(height: 20,),
               RichText(text: const TextSpan(
                 children: [
                   TextSpan(
                     text: 'This code will expire in ',
                     style: TextStyle(
                       color: Colors.grey,
                     )
                   ),
                   TextSpan(
                     text: '120s',
                     style: TextStyle(
                       color: AppColors.primaryColor,
                     )
                   ),
                 ]
               ),),
                const SizedBox(height: 8,),
                const Text('Resend Code',style: TextStyle(
                  color: Colors.grey,
                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
   textEditingController.dispose();
    super.dispose();
  }
}

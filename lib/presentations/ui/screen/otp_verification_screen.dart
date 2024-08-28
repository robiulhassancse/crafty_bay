import 'dart:async';

import 'package:crafty_bay/data/model/user_profile/read_profile_model.dart';
import 'package:crafty_bay/presentations/state_holder/read_profile_controller.dart';
import 'package:crafty_bay/presentations/state_holder/verify_otp_controller.dart';
import 'package:crafty_bay/presentations/ui/screen/complete_profile_screen.dart';
import 'package:crafty_bay/presentations/ui/screen/home_screen.dart';
import 'package:crafty_bay/presentations/ui/screen/main_bottom_navbar_screen.dart';
import 'package:crafty_bay/presentations/ui/screen/splash_screen.dart';
import 'package:crafty_bay/presentations/ui/utility/app_colors.dart';
import 'package:crafty_bay/presentations/ui/widgets/app_logo.dart';
import 'package:crafty_bay/presentations/ui/widgets/snakbar_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key, required this.email});
  final String email;

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ReadProfileController _readProfileController = Get.find<ReadProfileController>();


  int resendTime = 120;
  late Timer countdownTimer;
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  startTimer() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        resendTime = resendTime - 1;
      });
      if (resendTime < 1) {
        countdownTimer.cancel();
      }
    });
  }
  stopTimer(){
    if(countdownTimer.isActive){
      countdownTimer.cancel();
    }
  }

  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
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
                    length: 6,
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
                    controller: _otpTEController,
                    onCompleted: (v) {},
                    appContext: context,
                  ),

                  const SizedBox(height: 16,),
                  GetBuilder<VerifyOtpController>(
                    builder: (verifyOtpController) {
                      if(verifyOtpController.getVerifyOtpInProgress){
                        return const Center(child: CircularProgressIndicator(),);
                      }
                      return ElevatedButton(
                        onPressed: () async {

                          if(_formKey.currentState!.validate()) {
                            bool result = await verifyOtpController
                                .getVerifyOtp(
                                widget.email, _otpTEController.text);
                            if (result) {
                              showSnackMessage(context, 'OTP Verification Successful');
                              // Get.to(()=>const CompleteProfileScreen());
                            // await Get.find<ReadProfileController>().readProfile();
                            await _readProfileController.readProfile();
                            if(_readProfileController.readProfileModel.profileDataList == null){
                              await Get.to(()=>const CompleteProfileScreen());
                            }
                            else{
                              Get.offAll(()=> const SplashScreen());
                            }
                            // Get.find<ReadProfileController>()
                            //             .readProfileModel
                            //             .profileDataList ==
                            //         null
                            //     ? Get.offAll(() => CompleteProfileScreen())
                            //     : Get.offAll(() => MainBottomNavBarScreen());
                          }
                            else {
                              if (mounted) {
                                // showSnackMessage(
                                //     context, verifyOtpController.errorMessage);
                                showSnackMessage(context, 'OTP Verification failed! Try Again');
                              }
                            }
                          }
                        },
                        child: const Text('Next'),
                      );
                    }
                  ),
                  const SizedBox(height: 20,),
                 RichText(text:  TextSpan(
                   children: [
                     const TextSpan(
                       text: 'This code will expire in ',
                       style: TextStyle(
                         color: Colors.grey,
                       )
                     ),

                     TextSpan(
                       text: '$resendTime\s',
                       style: const TextStyle(
                         color: AppColors.primaryColor,
                       )
                     ),
                   ]
                 ),),
                  const SizedBox(height: 8,),
              resendTime ==0 ? InkWell(
                  onTap: (){
                    resendTime=120;
                    startTimer();
                  },child: const Text('Resend Code',style: TextStyle(color: Colors.grey,fontSize: 16),),
                ):const SizedBox(),

                  // resendTime != 0 ? const SizedBox() : const SizedBox(),

                ],
              ),
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

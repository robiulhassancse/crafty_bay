import 'package:crafty_bay/presentations/ui/screen/otp_verification_screen.dart';
import 'package:crafty_bay/presentations/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100,),
                const AppLogo(),
                const SizedBox(height: 24,),
                Text('Welcome Back',style: textTheme.titleLarge),
                const SizedBox(height: 4,),
                Text('Please Enter Your Email Address',style: textTheme.displaySmall,),
                const SizedBox(height: 24,),
                TextFormField(
                  controller: _emailTEController,
                  decoration: const InputDecoration(
                    hintText: 'Email'
                  )
                ),
                const SizedBox(height: 16,),
                ElevatedButton(
                  onPressed: (){
                    Get.to(()=>const OtpVerificationScreen());
                  }, child: const Text('Next'),),
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    _emailTEController.dispose();
    super.dispose();
  }
}

import 'package:crafty_bay/presentations/state_holder/verify_email_controller.dart';
import 'package:crafty_bay/presentations/ui/screen/otp_verification_screen.dart';
import 'package:crafty_bay/presentations/ui/utility/constants.dart';
import 'package:crafty_bay/presentations/ui/widgets/app_logo.dart';
import 'package:crafty_bay/presentations/ui/widgets/snakbar_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _emailTEController,
                    decoration: const InputDecoration(
                      hintText: 'Email'
                    ),
                    validator: (String? value){
                      if(value?.isEmpty ?? true){
                        return 'Enter your email';
                      }
                      if(Constants.emailValidationRegExp.hasMatch(value!)== false){
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16,),
                  GetBuilder<VerifyEmailController>(
                    builder: (verifyEmailController) {
                      if(verifyEmailController.getVerifyEmailInProgress){
                        return Center(child: CircularProgressIndicator(),);
                      }
                      return ElevatedButton(
                        onPressed: (){
                          if(_formKey.currentState!.validate()){
                            verifyEmailController.getVerifyEmail(_emailTEController.text.trim()).then((result){
                              if(result){
                                Get.to(()=> OtpVerificationScreen(email: _emailTEController.text,));
                              }
                              else{
                                showSnackMessage(context, verifyEmailController.errorMessage);
                              }
                            }

                            );

                          }

                        }, child: const Text('Next'),);
                    }
                  ),
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
    _emailTEController.dispose();
    super.dispose();
  }
}

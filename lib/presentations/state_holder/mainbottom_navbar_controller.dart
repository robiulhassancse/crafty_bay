import 'package:crafty_bay/presentations/state_holder/user_auth_controller.dart';
import 'package:crafty_bay/presentations/ui/screen/email_verification_screen.dart';
import 'package:get/get.dart';

class MainBottomNavBarController extends GetxController{
  int _selectedSlider = 0;

  int get selectedSlider => _selectedSlider;

  Future<void> changeIndex(int index) async{
    if(index==2 || index ==3){
      final isLoggedIn = await UserAuthController.checkLoggedInState();
      if(!isLoggedIn){
        Get.to(()=> const EmailVerificationScreen());
        return;
      }
    }
    _selectedSlider = index;
    update();
  }
void backToHomeScreen(){
    changeIndex(0);
}
  void gotoCategoryScreen(){
    changeIndex(1);
  }
}
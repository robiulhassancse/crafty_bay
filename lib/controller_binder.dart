import 'package:crafty_bay/presentations/state_holder/mainbottom_navbar_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(MainBottomNavBarController());
  }

}
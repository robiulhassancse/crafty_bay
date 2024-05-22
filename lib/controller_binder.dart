import 'package:crafty_bay/presentations/state_holder/category_controller.dart';
import 'package:crafty_bay/presentations/state_holder/home_slider_controller.dart';
import 'package:crafty_bay/presentations/state_holder/mainbottom_navbar_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(MainBottomNavBarController());
    Get.put(HomeSliderController());
    Get.put(CategoryController());

  }

}
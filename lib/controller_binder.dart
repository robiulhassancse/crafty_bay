import 'package:crafty_bay/presentations/state_holder/category_controller.dart';
import 'package:crafty_bay/presentations/state_holder/home_slider_controller.dart';
import 'package:crafty_bay/presentations/state_holder/mainbottom_navbar_controller.dart';
import 'package:crafty_bay/presentations/state_holder/new_product_list_by_controller.dart';
import 'package:crafty_bay/presentations/state_holder/popular_list_by_controller.dart';
import 'package:crafty_bay/presentations/state_holder/product_list_by_category_controller.dart';
import 'package:crafty_bay/presentations/state_holder/special_product_list_by_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(MainBottomNavBarController());
    Get.put(HomeSliderController());
    Get.put(CategoryController());
    Get.put(ProductListByCategoryController());
    Get.put(PopularListByRemarkController());
    Get.put(SpecialProductListByController());
    Get.put(NewProductListController());

  }

}
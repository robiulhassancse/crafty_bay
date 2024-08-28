import 'package:crafty_bay/presentations/state_holder/add_to_cart_controller.dart';
import 'package:crafty_bay/presentations/state_holder/add_to_wish_list_controller.dart';
import 'package:crafty_bay/presentations/state_holder/cart_list_controller.dart';
import 'package:crafty_bay/presentations/state_holder/category_controller.dart';
import 'package:crafty_bay/presentations/state_holder/create_profile_controller.dart';
import 'package:crafty_bay/presentations/state_holder/create_review_controller.dart';
import 'package:crafty_bay/presentations/state_holder/delete_wish_list_product.dart';
import 'package:crafty_bay/presentations/state_holder/home_slider_controller.dart';
import 'package:crafty_bay/presentations/state_holder/mainbottom_navbar_controller.dart';
import 'package:crafty_bay/presentations/state_holder/new_product_list_by_controller.dart';
import 'package:crafty_bay/presentations/state_holder/popular_list_by_controller.dart';
import 'package:crafty_bay/presentations/state_holder/product_details_controller.dart';
import 'package:crafty_bay/presentations/state_holder/product_list_by_category_controller.dart';
import 'package:crafty_bay/presentations/state_holder/product_review_controller.dart';
import 'package:crafty_bay/presentations/state_holder/read_profile_controller.dart';
import 'package:crafty_bay/presentations/state_holder/special_product_list_by_controller.dart';
import 'package:crafty_bay/presentations/state_holder/verify_email_controller.dart';
import 'package:crafty_bay/presentations/state_holder/verify_otp_controller.dart';
import 'package:crafty_bay/presentations/state_holder/wish_list_controller.dart';
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
    Get.put(ProductDetailsController());
    Get.put(AddToCartController());
    Get.put(VerifyEmailController());
    Get.put(VerifyOtpController());
    Get.put(AddToWishListController());
    Get.put(WishListController());
    Get.put(CartListController());
    Get.put(ReadProfileController());
    Get.put(CreateProfileController());
    Get.put(CreateReviewController());
    Get.put(ProductReviewController());
    Get.put(DeleteProductListController());


  }

}
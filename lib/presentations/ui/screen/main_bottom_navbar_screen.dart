import 'package:crafty_bay/presentations/state_holder/category_controller.dart';
import 'package:crafty_bay/presentations/state_holder/home_slider_controller.dart';
import 'package:crafty_bay/presentations/state_holder/mainbottom_navbar_controller.dart';
import 'package:crafty_bay/presentations/state_holder/new_product_list_by_controller.dart';
import 'package:crafty_bay/presentations/state_holder/popular_list_by_controller.dart';
import 'package:crafty_bay/presentations/state_holder/special_product_list_by_controller.dart';
import 'package:crafty_bay/presentations/ui/screen/cart_list_screen.dart';
import 'package:crafty_bay/presentations/ui/screen/category_list_screen.dart';
import 'package:crafty_bay/presentations/ui/screen/home_screen.dart';
import 'package:crafty_bay/presentations/ui/screen/wish_list_screen.dart';
import 'package:crafty_bay/presentations/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavBarScreen extends StatefulWidget {
  const MainBottomNavBarScreen({super.key});

  @override
  State<MainBottomNavBarScreen> createState() => _MainBottomNavBarScreenState();
}

class _MainBottomNavBarScreenState extends State<MainBottomNavBarScreen> {
   final MainBottomNavBarController _navBarController = Get.find<MainBottomNavBarController>();
   // final HomeSliderController homeSliderController = Get.find<HomeSliderController>();
  final List<Widget>_screen =[
    const HomeScreen(),
    const CategoryListScreen(),
    const CardListScreen(),
    const WishListScreen(),
  ];
@override
  void initState() {
    super.initState();
    Get.find<HomeSliderController>().getHomeSlider();
    Get.find<CategoryController>().getCategory();
    Get.find<PopularListByRemarkController>().getPopularProductList();
    Get.find<SpecialProductListByController>().getSpecialProductList();
    Get.find<NewProductListController>().getNewProductList();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavBarController>(
      builder: (_) {
        return Scaffold(
          body: _screen[_navBarController.selectedSlider],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: AppColors.primaryColor,
            showSelectedLabels: true,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            currentIndex: _navBarController.selectedSlider,
            onTap: (int index){
              _navBarController.changeIndex(index);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.widgets),label: 'Categories'),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: 'Cart'),
              BottomNavigationBarItem(icon: Icon(Icons.card_giftcard_outlined),label: 'Wish'),
            ],
          ),
        );
      }
    );
  }
}

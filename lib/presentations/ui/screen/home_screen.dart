import 'dart:io';
import 'package:crafty_bay/data/model/category/category_data.dart';
import 'package:crafty_bay/data/model/category/product.dart';
import 'package:crafty_bay/presentations/state_holder/category_controller.dart';
import 'package:crafty_bay/presentations/state_holder/home_slider_controller.dart';
import 'package:crafty_bay/presentations/state_holder/mainbottom_navbar_controller.dart';
import 'package:crafty_bay/presentations/state_holder/new_product_list_by_controller.dart';
import 'package:crafty_bay/presentations/state_holder/popular_list_by_controller.dart';
import 'package:crafty_bay/presentations/state_holder/special_product_list_by_controller.dart';
import 'package:crafty_bay/presentations/ui/utility/assets_path.dart';
import 'package:crafty_bay/presentations/ui/widgets/appbar_icon_button.dart';
import 'package:crafty_bay/presentations/ui/widgets/category_item.dart';
import 'package:crafty_bay/presentations/ui/widgets/home_carosul_slider.dart';
import 'package:crafty_bay/presentations/ui/widgets/product_cart.dart';
import 'package:crafty_bay/presentations/ui/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Do you want to exit here'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    exit(0);
                  },
                  child: const Text('Ok'),
                ),
              ],
            );
          },
        );
        Get.find<MainBottomNavBarController>().changeIndex(0);
        return false;
      },

      child: Scaffold(
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildSearchFormField(),
                SizedBox(
                    height: 220,

                    child: GetBuilder<HomeSliderController>(
                      builder: (homeSilderController) {
                        if(homeSilderController.getHomeSliderInProgress){
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return  HomeCarosulSlider(sliderList: homeSilderController.sliderList,);
                      }
                    )),
                SectionHeader(title: 'All Categories', onTabSeeAll: () {
                  Get.find<MainBottomNavBarController>().gotoCategoryScreen();
                },),
                const SizedBox(
                  height: 8,
                ),
                GetBuilder<CategoryController>(
                  builder: (categoryController) {
                    if(categoryController.getCategoryInProgress){
                      return const SizedBox(
                        height: 110,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    return _buildCategoryItem(categoryController.categoryList);
                  }
                ),
                SectionHeader(title: 'Popular', onTabSeeAll: (){}),
                GetBuilder<PopularListByRemarkController>(
                  builder: (popularProductListController) {
                    if(popularProductListController.popularProductListInProgress){
                      return const SizedBox(
                        height: 165,
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                    return _buildProductCartList(
                      popularProductListController.popularProductList,
                    );
                  }
                ),
                SectionHeader(title: 'Special', onTabSeeAll: (){}),
                GetBuilder<SpecialProductListByController>(
                  builder: (specialProductListController) {
                    if(specialProductListController.specialProductListInProgress){
                      return const SizedBox(height: 165,
                      child: Center(child: CircularProgressIndicator()),
                      );
                    }
                    return _buildProductCartList(
                      specialProductListController.specialProductList
                    );
                  }
                ),
                SectionHeader(title: 'New', onTabSeeAll: (){}),
                GetBuilder<NewProductListController>(
                  builder: (newProductListController) {
                    if(newProductListController.newProductListInProgress){
                      return const SizedBox(height: 165,child: Center(child: CircularProgressIndicator()),);
                    }
                    return _buildProductCartList(newProductListController.newProductList);
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryItem(List<CategoryData> categoryList) {
    return InkWell(
      onTap: (){},
      child: SizedBox(
                height: 110,
                child: ListView.separated(
                  itemCount: categoryList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                  return  CategoryItem(categoryData: categoryList[index],);
                }, separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(width: 8,);
                },),
              ),
    );
  }

  Widget _buildProductCartList(List<Product>productList) {
    return SizedBox(
              height: 165,
              child: ListView.separated(
                  itemCount: productList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                return  ProductCart(product: productList[index],);
              }, separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      width: 8,
                    );
              },),
            );
  }

  Widget _buildSearchFormField() {
    return TextFormField(
      controller: _searchTEController,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search_rounded),
        hintText: 'Search',
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        fillColor: Colors.grey.shade300,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: SvgPicture.asset(AssetsPath.appLogoNacSVG),
      actions: [
        AppBarIconButton(
          icon: Icons.person,
          ontap: () {},
        ),
        const SizedBox(
          width: 8,
        ),
        AppBarIconButton(
          icon: Icons.phone,
          ontap: () {},
        ),
        const SizedBox(
          width: 8,
        ),
        AppBarIconButton(
          icon: Icons.notifications_active,
          ontap: () {},
        ),
        const SizedBox(
          width: 8,
        ),
      ],
    );
  }
}





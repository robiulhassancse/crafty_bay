import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/presentations/state_holder/mainbottom_navbar_controller.dart';
import 'package:crafty_bay/presentations/ui/utility/app_colors.dart';
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

                    child: const HomeCarosulSlider()),
                SectionHeader(title: 'All Categories', onTabSeeAll: () { },),
                const SizedBox(
                  height: 8,
                ),
                _buildCategoryItem(),
                SectionHeader(title: 'Popular', onTabSeeAll: (){}),
                _buildProductCartList(),
                SectionHeader(title: 'Special', onTabSeeAll: (){}),
                _buildProductCartList(),
                SectionHeader(title: 'New', onTabSeeAll: (){}),
                _buildProductCartList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryItem() {
    return InkWell(
      onTap: (){},
      child: SizedBox(
                height: 110,
                child: ListView.separated(
                  itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                  return  const CategoryItem();
                }, separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(width: 8,);
                },),
              ),
    );
  }

  Widget _buildProductCartList() {
    return SizedBox(
              height: 165,
              child: ListView.separated(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                return  const ProductCart();
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





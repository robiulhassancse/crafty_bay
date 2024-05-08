import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/presentations/ui/utility/app_colors.dart';
import 'package:crafty_bay/presentations/ui/utility/assets_path.dart';
import 'package:crafty_bay/presentations/ui/widgets/appbar_icon_button.dart';
import 'package:crafty_bay/presentations/ui/widgets/category_item.dart';
import 'package:crafty_bay/presentations/ui/widgets/product_cart.dart';
import 'package:crafty_bay/presentations/ui/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchTEController = TextEditingController();

  final ValueNotifier<int> _selectedPageIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildSearchFormField(),
              const SizedBox(
                height: 8,
              ),
              _buildCarouselSlider(),
              const SizedBox(
                height: 4,
              ),
              _buildDotIndicator(),
              const SizedBox(
                height: 16,
              ),
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
                return  ProductCart();
              }, separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 8,
                    );
              },),
            );
  }

  Widget _buildDotIndicator() {
    return ValueListenableBuilder(
        valueListenable: _selectedPageIndex,
        builder: (context, currentPage, _) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 5; i++)
                Container(
                  height: 10,
                  width: 10,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    color: i == currentPage ? AppColors.primaryColor : null,
                    border: Border.all(color: i == currentPage
                        ? AppColors.primaryColor
                        : Colors.grey),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
            ],
          );
        });
  }

  Widget _buildCarouselSlider() {
    return CarouselSlider(
      options: CarouselOptions(
          height: 180.0,
          viewportFraction: 1,
          autoPlay: false,
          onPageChanged: (int index, _) {
            _selectedPageIndex.value = index;
          },
          autoPlayAnimationDuration: const Duration(seconds: 2)),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Text(
                  'text $i',
                  style: const TextStyle(fontSize: 16.0),
                ));
          },
        );
      }).toList(),
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





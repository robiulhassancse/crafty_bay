import 'package:crafty_bay/data/model/category/category_data.dart';
import 'package:crafty_bay/presentations/ui/screen/product_list_screen.dart';
import 'package:crafty_bay/presentations/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key, required this.categoryData,
  });
  final CategoryData categoryData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(()=> ProductListScreen(categoryName: categoryData.categoryName ?? '', categoryId: categoryData.id!),);
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16)
            ),
            child: Image.network(categoryData.categoryImg ?? '',height: 50, width: 50,),
          ),
          const SizedBox(height: 4,),
           Text(categoryData.categoryName ?? '',style: const TextStyle(
            color: AppColors.primaryColor,
            fontSize: 16,
            letterSpacing: 0.5,
          ),)
        ],
      ),
    );
  }
}
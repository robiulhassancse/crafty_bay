import 'package:crafty_bay/presentations/ui/screen/product_list_screen.dart';
import 'package:crafty_bay/presentations/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(()=> const ProductListScreen(categoryName: 'Electronics'));
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16)
            ),
            child: const Icon(Icons.desktop_windows_outlined,color: AppColors.primaryColor,size: 50,),
          ),
          const SizedBox(height: 4,),
          const Text('Electronics',style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 16,
            letterSpacing: 0.5,
          ),)
        ],
      ),
    );
  }
}
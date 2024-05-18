import 'package:crafty_bay/presentations/ui/screen/product_details_screen.dart';
import 'package:crafty_bay/presentations/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCart extends StatelessWidget {
  const ProductCart({
    super.key,
    this.showAddToWishList = true,
  });

  final bool showAddToWishList;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.offAll(()=> const ProductDetailsScreen());
      },
      child: SizedBox(
        width: 140,
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Container(
                width: 140,
                height: 90,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.1),
                    image: const DecorationImage(
                        image: NetworkImage(
                            'https://parspng.com/wp-content/uploads/2023/02/shoespng.parspng.com_.png')),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8),
                      topLeft: Radius.circular(8),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text(
                      'New Nike Shoe 80657',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '\$100',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Wrap(
                          children: [
                            const Icon(
                              Icons.star,
                              size: 16,
                              color: Colors.amber,
                            ),
                            Text(
                              '3.8',
                              style: TextStyle(color: Colors.grey.shade600),
                            ),
                          ],
                        ),
                        _builAddToWishCartButton()
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Visibility _builAddToWishCartButton() {
    return Visibility(
      visible: showAddToWishList,
      replacement: _getIconButton(Icons.delete_forever_outlined),
      child: _getIconButton(Icons.favorite_border),
    );
  }

  Widget _getIconButton(IconData icon) {
    return Card(
      color: AppColors.primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Icon(
          icon,
          size: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}

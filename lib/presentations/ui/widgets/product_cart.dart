import 'package:crafty_bay/data/model/category/product.dart';
import 'package:crafty_bay/presentations/ui/screen/product_details_screen.dart';
import 'package:crafty_bay/presentations/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCart extends StatelessWidget {
  const ProductCart({
    super.key,
    this.showAddToWishList = true, required this.product,
  });

  final bool showAddToWishList;
  final Product product;

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
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8),
                      topLeft: Radius.circular(8),
                    ),
                ),
                child: Image.network(product.image ?? ''),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                     Text(
                     product.title ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text(
                          '\$${product.price}',
                          style: const TextStyle(
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
                              '${product.star}',
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

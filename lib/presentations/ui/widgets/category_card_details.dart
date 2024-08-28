import 'package:crafty_bay/data/model/cart_list/cart_list_item.dart';
import 'package:crafty_bay/data/model/category/cart_item.dart';
import 'package:crafty_bay/presentations/state_holder/cart_list_controller.dart';
import 'package:crafty_bay/presentations/state_holder/delete_wish_list_product.dart';
import 'package:crafty_bay/presentations/ui/utility/app_colors.dart';
import 'package:crafty_bay/presentations/ui/widgets/custom_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryCartList extends StatefulWidget {
  const CategoryCartList({
    super.key,
    required this.cartItemModel,
  });

  final CartItemModel cartItemModel;

  @override
  State<CategoryCartList> createState() => _CategoryCartListState();
}

class _CategoryCartListState extends State<CategoryCartList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      child: Column(
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                _buildCardImageAdded(),
                _buildCardAllContents(widget.cartItemModel),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardAllContents(CartItemModel cartItem) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.cartItemModel.product?.title ?? '',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      _buildColorAndSize()
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    // cartItem.productId ?? '';
                   await deleteCartProduct(cartItem.productId!);
                  },
                  icon: Icon(
                    Icons.delete_forever_outlined,
                    size: 30,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
            _buildIncrementButton()
          ],
        ),
      ),
    );
  }

  Widget _buildCardImageAdded() {
    return Container(
      margin: const EdgeInsets.all(8),
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(widget.cartItemModel.product?.image ?? ''),
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          bottomLeft: Radius.circular(8),
        ),
      ),
    );
  }

  Widget _buildIncrementButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '\$${widget.cartItemModel.product?.price ?? 0}',
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: AppColors.primaryColor),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: CustomStepper(
              lowerLimit: 1,
              upperLimit: 10,
              stepValue: 1,
              value: 1,
              onChange: (int index) {}),
        ),
      ],
    );
  }

  Widget _buildColorAndSize() {
    return RichText(
        text: TextSpan(
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            children: [
          TextSpan(
            text: ('Colors: ${widget.cartItemModel.color ?? ''}  '),
          ),
          TextSpan(
            text: ('Size: ${widget.cartItemModel.size ?? ''} '),
          ),
        ]));
  }

  Future<void> deleteCartProduct(int productId) async {
    final response = await Get.find<DeleteProductListController>()
        .deleteWishList(productId);
    if (response) {
      Get.snackbar('Success', 'Product delete successful.',
          // backgroundColor: AppColors.greenColor,
          // colorText: AppColors.foregroundColor,
          borderRadius: 10,
          snackPosition: SnackPosition.BOTTOM);
      Get.find<CartListController>().getCartProducts();
    } else {
      Get.snackbar('Failed', 'Product delete failed! Try again',
          // backgroundColor: AppColors.alertColor,
          // colorText: AppColors.foregroundColor,
          borderRadius: 10,
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}

import 'package:crafty_bay/presentations/state_holder/cart_list_controller.dart';
import 'package:crafty_bay/presentations/ui/screen/product_details_screen.dart';
import 'package:crafty_bay/presentations/ui/utility/app_colors.dart';
import 'package:crafty_bay/presentations/ui/widgets/category_card_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardListScreen extends StatefulWidget {
  const CardListScreen({super.key});

  @override
  State<CardListScreen> createState() => _CardListScreenState();
}

class _CardListScreenState extends State<CardListScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Get.find<CartListController>().getCartProducts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: GetBuilder<CartListController>(builder: (cartListController) {
        if (cartListController.getCartProductsInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartListController.cartListModel.cartList?.length ?? 0,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        Get.to(()=> ProductDetailsScreen(productId: cartListController.cartListModel.cartList![index].productId!));
                      },
                      child: CategoryCartList(
                          cartItemModel: cartListController.cartListModel.cartList![index]));
                },
              ),
            ),
            _buildStickyTotalPrice(cartListController.totalPrice),
          ],
        );
      }),
    );
  }

  Widget _buildStickyTotalPrice(double totalPrice) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.2),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Price',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  '\$${totalPrice}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(
                width: 130,
                child: ElevatedButton(
                    onPressed: () {}, child: const Text('CheckOut')))
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          const Text(
            'Cart',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ],
      ),
    );
  }
}

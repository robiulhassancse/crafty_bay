import 'package:crafty_bay/data/model/category/cart_model.dart';
import 'package:crafty_bay/data/model/category/product_details_model.dart';
import 'package:crafty_bay/presentations/state_holder/add_to_cart_controller.dart';
import 'package:crafty_bay/presentations/state_holder/add_to_wish_list_controller.dart';
import 'package:crafty_bay/presentations/state_holder/mainbottom_navbar_controller.dart';
import 'package:crafty_bay/presentations/state_holder/product_details_controller.dart';
import 'package:crafty_bay/presentations/ui/screen/create_review_screen.dart';
import 'package:crafty_bay/presentations/ui/utility/app_colors.dart';
import 'package:crafty_bay/presentations/ui/widgets/custom_stepper.dart';
import 'package:crafty_bay/presentations/ui/widgets/products_carosul_slider.dart';
import 'package:crafty_bay/presentations/ui/widgets/size_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final int productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _counterValue =1;
  String? _selectedColor;
  String? _selectedSize;

  @override
  void initState() {
    super.initState();
    Get.find<ProductDetailsController>().getProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async{
          // Navigator.of(context).pop();
          Get.find<MainBottomNavBarController>().backToHomeScreen();
          return false;
        },
        child: SafeArea(
          child: GetBuilder<ProductDetailsController>(
              builder: (productDetailsController) {
                if (productDetailsController.productDetailsInProgress) {
                  return const Center(child: CircularProgressIndicator(),);
                }
                List<String> colors = productDetailsController.productDetailsModel.color?.split(',') ?? [];
                List<String> sizes = productDetailsController.productDetailsModel.size?.split(',') ?? [];
                _selectedColor= colors.first;
                _selectedSize = sizes.first;

                return Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            _buildProductDetailsSliderSection(
                                productDetailsController.productDetailsModel),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8),
                              child: Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildTitleHeaderSection( productDetailsController.productDetailsModel),
                                    _buildReviewSection(productDetailsController.productDetailsModel),
                                    SizePicker(
                                      sizes: colors,
                                      onChange: (String s) {
                                        _selectedColor = s;
                                      },
                                      isRounded: false,
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    SizePicker(
                                      sizes: sizes,
                                      onChange: (String s) {
                                        _selectedSize = s;
                                      },
                                    ),
                                    _buildProductDescriptions(productDetailsController.productDetailsModel),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    _buildBottomPriceCart(
                        productDetailsController.productDetailsModel)
                  ],
                );
              }
          ),
        ),
      ),
    );
  }

  Widget _buildBottomPriceCart(ProductDetailsModel productDetails) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.15),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Price', style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade700,
                ),),
                const SizedBox(
                  height: 4,
                ),
                Text('\$${productDetails.product?.price ?? 0}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                  ),),
              ],
            ),
            SizedBox(
                width: 130,
                child: GetBuilder<AddToCartController>(
                    builder: (addToCartController) {
                      if (addToCartController.getAddToCartInProgress) {
                        return const Center(
                          child: CircularProgressIndicator(),);
                      }
                      return ElevatedButton(
                          onPressed: () {
                            CartModel cartModel = CartModel(
                                productId: widget.productId,
                                color: _selectedColor ?? '',
                                size: _selectedSize ?? '',
                                quantity: _counterValue);
                            addToCartController.getAddToCart(cartModel);
                          }, child: const Text('Add to Cart'));
                    }
                ))
          ],
        ),
      ),
    );
  }

  Widget _buildTitleHeaderSection(ProductDetailsModel productDetails) {
    return Row(
      children: [
        Expanded(
            child: Text(
              productDetails.product!.title ?? '',
              // 'Happy New Year Special Deal Save 30%',
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.9),
            )),
        CustomStepper(
            lowerLimit: 1,
            upperLimit: 10,
            stepValue: 1,
            value: 1,
            onChange: (int index) {})
      ],
    );
  }

  Widget _buildProductDescriptions(ProductDetailsModel productDetails) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Description',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          productDetails.product!.shortDes ?? '', style: TextStyle(
            color: Colors.grey.shade600,
            letterSpacing: 0.8
        ),),
        const SizedBox(
          height: 4,
        ),
        Text(
          productDetails.des ?? '', style: TextStyle(
            color: Colors.grey.shade600,
            letterSpacing: 0.8
        ),),
      ],
    );
  }

  Widget _buildReviewSection(ProductDetailsModel productDetails) {
    return Row(
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            Text(
              '${productDetails.product?.star ?? 0}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            Get.offAll(() => const CreateReviewScreen());
          },
          child: const Text(
            'Reviews',
            style: TextStyle(color: AppColors.primaryColor, fontSize: 16),
          ),
        ),
        GetBuilder<AddToWishListController>(
          builder: (addToWishListController) {
            if(addToWishListController.getAddToWishListInProgress){
              return const CircularProgressIndicator();
            }
            return InkWell(
              onTap: (){
                addToWishListController.getAddToWishList(widget.productId);
              },
              child: Card(
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: AppColors.primaryColor,
                  ),
                  child: const Icon(
                    Icons.favorite_border,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          }
        )
      ],
    );
  }

  // ProductDetailsModel productDetails = ProductDetailsModel();

  Widget _buildProductDetailsSliderSection(ProductDetailsModel productDetails) {
    return Stack(
      children: [
        SizedBox(
          height: 280,
          child: ProductCarosulSlider(images: [
            productDetails.img1 ?? '',
            productDetails.img2 ?? '',
            productDetails.img3 ?? '',
            productDetails.img4 ?? '',
          ],),
        ),
        AppBar(
          title: Row(
            children: [
              IconButton(
                onPressed: () {
                  Get.find<MainBottomNavBarController>().backToHomeScreen();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black54,
                ),
              ),
              Text(
                'Product Details',
                style: TextStyle(color: Colors.grey.shade700, fontSize: 16),
              )
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ],
    );
  }
}



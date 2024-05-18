import 'package:crafty_bay/presentations/ui/utility/app_colors.dart';
import 'package:crafty_bay/presentations/ui/widgets/color_picker.dart';
import 'package:crafty_bay/presentations/ui/widgets/custom_stepper.dart';
import 'package:crafty_bay/presentations/ui/widgets/products_carosul_slider.dart';
import 'package:crafty_bay/presentations/ui/widgets/size_picker.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildProductDetailsSliderSection(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8),
                      child: Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildTitleHeaderSection(),
                            _buildReviewSection(),
                            const ColorsPicker(),
                            const SizedBox(
                              height: 8,
                            ),
                            const SizePicker(),
                            _buildProductDescriptions(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildBottomPriceCart()
          ],
        ),
      ),
    );
  }

  Widget _buildBottomPriceCart() {
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
                      Text('Price',style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade700,
                      ),),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text('\$1,000',style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),),
                    ],
                  ),
                  SizedBox(
                      width: 130,
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text('Add to Cart')))
                ],
              ),
            ),
          );
  }

  Widget _buildTitleHeaderSection() {
    return Row(
                            children: [
                              const Expanded(
                                  child: Text(
                                'Happy New Year Special Deal Save 30%',
                                style: TextStyle(
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

  Widget _buildProductDescriptions() {
    return  Column(
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
            '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.''',style: TextStyle(
          color: Colors.grey.shade600,
          letterSpacing: 0.8
        ),),
      ],
    );
  }

  Widget _buildReviewSection() {
    return Row(
      children: [
        const Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Icon(
              Icons.star,
              color: Colors.amber,
            ),
            Text(
              '4.8',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Reviews',
            style: TextStyle(color: AppColors.primaryColor, fontSize: 16),
          ),
        ),
        Card(
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
        )
      ],
    );
  }

  Widget _buildProductDetailsSliderSection() {
    return Stack(
      children: [
        const SizedBox(
          height: 280,
          child: ProductCarosulSlider(),
        ),
        AppBar(
          title: Row(
            children: [
              IconButton(
                onPressed: () {},
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

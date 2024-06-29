import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/presentations/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';

class ProductCarosulSlider extends StatefulWidget {
  const ProductCarosulSlider({super.key, required this.images});

  final List<String> images;

  @override
  State<ProductCarosulSlider> createState() => _ProductCarosulSliderState();
}

class _ProductCarosulSliderState extends State<ProductCarosulSlider> {
  final ValueNotifier<int> _selectedPageIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              _buildCarouselSlider(),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: _buildDotIndicator(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDotIndicator() {
    return ValueListenableBuilder(
        valueListenable: _selectedPageIndex,
        builder: (context, currentPage, _) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < widget.images.length; i++)
                Container(
                  height: 10,
                  width: 10,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    color: i == currentPage ? AppColors.primaryColor : null,
                    border: Border.all(
                        color: i == currentPage
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
          height: 260.0,
          viewportFraction: 1,
          autoPlay: false,
          onPageChanged: (int index, _) {
            _selectedPageIndex.value = index;
          },
          autoPlayAnimationDuration: const Duration(seconds: 2)),
      items: widget.images.map((image) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.grey.shade300,
                alignment: Alignment.center,
                child: Image.network(image,fit: BoxFit.cover,));
          },
        );
      }).toList(),
    );
  }
}


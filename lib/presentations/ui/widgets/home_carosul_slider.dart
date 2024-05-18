import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/presentations/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';

class HomeCarosulSlider extends StatefulWidget {
  const HomeCarosulSlider({super.key});

  @override
  State<HomeCarosulSlider> createState() => _HomeCarosulSliderState();
}

class _HomeCarosulSliderState extends State<HomeCarosulSlider> {

  final ValueNotifier<int> _selectedPageIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
}

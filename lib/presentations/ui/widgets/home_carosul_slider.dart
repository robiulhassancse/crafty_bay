import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/data/model/slider/slider_data.dart';
import 'package:crafty_bay/presentations/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';

class HomeCarosulSlider extends StatefulWidget {
  const HomeCarosulSlider({super.key, required this.sliderList});

  final List<SliderData> sliderList;

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
              for (int i = 0; i < widget.sliderList.length; i++)
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
          height: 180.0,
          viewportFraction: 1,
          autoPlay: false,
          onPageChanged: (int index, _) {
            _selectedPageIndex.value = index;
          },
          autoPlayAnimationDuration: const Duration(seconds: 2)),
      items: widget.sliderList.map((sliderData) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Image.network(
                      sliderData.image ?? '',
                      height: double.maxFinite,
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      height: 220,
                      width: 220,
                      decoration: const BoxDecoration(
                          // color: Colors.green,
                          ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              sliderData.title ?? '',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                              ),
                            ),
                            Text(
                              sliderData.shortDes ?? '',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 16,),
                            // Column(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     SizedBox(
                            //       width: 100,
                            //         height: 40,
                            //         child: ElevatedButton(
                            //           style: ElevatedButton.styleFrom(
                            //             padding: EdgeInsets.zero,
                            //             textStyle: const TextStyle(
                            //               fontSize: 18,
                            //             )
                            //           ),
                            //             onPressed: () {}, child: const Text('Buy Now',))),
                            //   ],
                            // )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 110,
                      bottom: 0,
                      left: 0,
                      right: 180,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: 100,
                              height: 40,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      textStyle: const TextStyle(
                                        fontSize: 18,
                                      )
                                  ),
                                  onPressed: () {}, child: const Text('Buy Now',),),),
                        ],
                      ),
                    ),
                  ],
                ));
          },
        );
      }).toList(),
    );
  }
}

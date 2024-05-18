import 'package:crafty_bay/presentations/ui/utility/app_colors.dart';
import 'package:crafty_bay/presentations/ui/widgets/custom_stepper.dart';
import 'package:flutter/material.dart';

class CategoryCartList extends StatelessWidget {
  const CategoryCartList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 2.0),
      child: Column(
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                _buildCardImageAdded(),
                _buildCardAllContents(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardAllContents() {
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
                                const Text(
                                  'New Year Special Shoe',
                                  style: TextStyle(
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
                            onPressed: () {},
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
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://parspng.com/wp-content/uploads/2023/02/shoespng.parspng.com-12.png',
                    ),
                  ),
                  borderRadius: BorderRadius.only(
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
        const Text(
          '\$100',
          style: TextStyle(
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
            children: const [
          TextSpan(
            text: ('Colors: Red  '),
          ),
          TextSpan(
            text: ('Size: X'),
          ),
        ]));
  }
}

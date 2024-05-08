import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key, required this.title, required this.onTabSeeAll,
  });

  final String title;
  final VoidCallback onTabSeeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
        TextButton(onPressed: onTabSeeAll,
            child: const Text('See All', style: TextStyle(fontSize: 16),))
      ],
    );
  }
}
import 'package:flutter/material.dart';

class ColorsPicker extends StatefulWidget {
  const ColorsPicker({super.key});

  @override
  State<ColorsPicker> createState() => _ColorsPickerState();
}

class _ColorsPickerState extends State<ColorsPicker> {
  List<Color>colorList = [
    Colors.black,
    Colors.green,
    Colors.orange,
    Colors.red,
    Colors.pink,
    Colors.blueGrey,
  ];
  int _selectedColorsIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Color', style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w500),),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 30,
          child: ListView.builder(
            itemCount: colorList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  _selectedColorsIndex= index;
                  setState(() {});
                },
                child: CircleAvatar(
                  backgroundColor: colorList[index],
                  child: _selectedColorsIndex == index? const Icon(Icons.done): null,
                ),
              );
            },),
        ),
      ],
    );
  }
}

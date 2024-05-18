import 'package:crafty_bay/presentations/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({super.key});

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  List<String>sizeList=[
    'S',
    'X',
    'XL',
    'XXL',
  ];

  int _selectedSizesIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Size',style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 30,
          child: ListView.separated(
            itemCount: sizeList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
              return  GestureDetector(
                onTap: (){
                  _selectedSizesIndex = index;
                  setState(() {});
                },
                child: Container(
                  height: 30,
                  width: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: _selectedSizesIndex==index?AppColors.primaryColor:null,
                      border: Border.all(
                          color: _selectedSizesIndex == index ? AppColors.primaryColor : Colors.grey
                      )
                  ),
                  child: FittedBox(child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(sizeList[index],style: TextStyle(
                      color: _selectedSizesIndex==index ? Colors.white:Colors.black,
                    ),),
                  )),
                ),
              );
            }, separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              width: 12,
            );
          },),
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}

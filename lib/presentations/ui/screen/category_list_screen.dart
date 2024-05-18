import 'package:crafty_bay/presentations/state_holder/mainbottom_navbar_controller.dart';
import 'package:crafty_bay/presentations/ui/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        AlertDialog(title: const Text('Do you want to exit here'),actions: [
          TextButton(onPressed: (){}, child: const Text('Cancel'),),
          TextButton(onPressed: (){}, child: const Text('Ok'),),
        ],);
        Get.find<MainBottomNavBarController>().backToHomeScreen();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            children: [
        IconButton(onPressed: (){
          Get.find<MainBottomNavBarController>().backToHomeScreen();
        },icon: const Icon(
        Icons.arrow_back_ios,color: Colors.black54,),),
              const Text('Category',style: TextStyle(fontSize: 20,color: Colors.black54),),
            ],
          ),
        ),
        body: GridView.builder(
            itemCount: 16,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          // crossAxisSpacing: 2,
          mainAxisSpacing: 4,
        ), itemBuilder: (context,index){
          return const FittedBox(child: Padding(
            padding: EdgeInsets.all(8.0),
            child: CategoryItem(),
          ));
        }),
      ),
    );
  }
}

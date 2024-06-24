import 'package:crafty_bay/presentations/state_holder/mainbottom_navbar_controller.dart';
import 'package:crafty_bay/presentations/ui/widgets/product_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Do you want to exit here'),
              actions: [
                TextButton(
                  onPressed: () {
                    Get.to(()=> const WishListScreen());
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Ok'),
                ),
              ],
            );
          },
        );
        Get.find<MainBottomNavBarController>().backToHomeScreen();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Get.find<MainBottomNavBarController>().backToHomeScreen();
            },
            color: Colors.black54,
          ),
          title: const Text(
            'Wish List',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 20,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                // return const FittedBox(
                //     child: ProductCart(
                //   showAddToWishList: false,
                // ));
              }),
        ),
      ),
    );
  }
}

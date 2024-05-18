import 'package:crafty_bay/presentations/ui/widgets/category_item.dart';
import 'package:crafty_bay/presentations/ui/widgets/product_cart.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.categoryName});
final String categoryName;
  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading:  BackButton(
          onPressed: (){

          },
          color: Colors.black54,
        ),
        title: Text(widget.categoryName,style: const TextStyle(color: Colors.black54,fontSize: 20),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
              mainAxisSpacing: 8,
              childAspectRatio: 0.9,
              crossAxisSpacing: 8,

        ), itemBuilder: (context, index){
          return const FittedBox(child: ProductCart());
        }),
      ),
    );
  }
}

import 'package:crafty_bay/presentations/state_holder/product_list_by_category_controller.dart';
import 'package:crafty_bay/presentations/ui/widgets/product_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.categoryName, required this.categoryId});
final String categoryName;
final int categoryId;
  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<ProductListByCategoryController>().getProductList(widget.categoryId);
  }
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
        child: GetBuilder<ProductListByCategoryController>(
          builder: (productListByCategoryController) {
            if(productListByCategoryController.getProductListInProgress){
              return const CircularProgressIndicator();
            }
            return GridView.builder(
                itemCount: productListByCategoryController.productList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.9,
                  crossAxisSpacing: 8,

            ), itemBuilder: (context, index){
              return  FittedBox(child: ProductCart(product: productListByCategoryController.productList[index],));
            });
          }
        ),
      ),
    );
  }
}

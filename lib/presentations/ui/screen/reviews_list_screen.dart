import 'package:crafty_bay/data/model/review/product_review_model.dart';
import 'package:crafty_bay/data/model/review/review_data.dart';
import 'package:crafty_bay/presentations/state_holder/product_review_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewListScreen extends StatefulWidget {
  const ReviewListScreen({super.key, required this.productId});

  final int productId;

  @override
  State<ReviewListScreen> createState() => _ReviewListScreenState();
}

class _ReviewListScreenState extends State<ReviewListScreen> {

  @override
  void initState() {
    super.initState();
    Get.find<ProductReviewController>().getProductReview(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_ios,color: Colors.black,),),
            const Text('Review',style: TextStyle(fontSize: 16,color: Colors.black),),
          ],
        ),
      ),
      body:  GetBuilder<ProductReviewController>(
        builder: (productReviewController) {
          if(productReviewController.getProductReviewInProgress){
            return const Center(child: CircularProgressIndicator(),);
          }
          return ListView.builder(
              itemCount: productReviewController.reviewList.length,
              itemBuilder: (context,index){
            return _buildReviewCard(productReviewController.reviewList.first);
          });
        }
      )
    );
  }

  Padding _buildReviewCard(ReviewData productReview) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
      child: Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius:15,
                            backgroundColor: Colors.grey.shade100,
                            child: const Icon(Icons.person,size: 20,color: Colors.grey,),
                          ),
                          const SizedBox(width: 8,),
                           Text(productReview.profile?.cusName ?? '',style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade700,
                          ),),
                        ],
                      ),
                       Text(productReview.description ?? '',style: const TextStyle(
                        color: Colors.grey,
                      ),),
                      ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

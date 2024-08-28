import 'package:crafty_bay/presentations/state_holder/create_review_controller.dart';
import 'package:crafty_bay/presentations/state_holder/product_review_controller.dart';
import 'package:crafty_bay/presentations/ui/screen/reviews_list_screen.dart';
import 'package:crafty_bay/presentations/ui/widgets/snakbar_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key, required this.productId});

  final int productId;

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  TextEditingController _firstNameTEController = TextEditingController();
  TextEditingController _lastNameTEController = TextEditingController();
  TextEditingController _descriptionNameTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  double _rating = 4.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            const Text(
              'Review',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _firstNameTEController,
                  decoration: const InputDecoration(hintText: 'First Name'),
                  validator: (String? value) {
                    if (value?.isEmpty == true) {
                      return 'Enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _lastNameTEController,
                  decoration: const InputDecoration(hintText: 'Last Name'),
                  validator: (String? value) {
                    if (value?.isEmpty == true) {
                      return 'Enter last name';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  maxLines: 8,
                  decoration: const InputDecoration(hintText: 'Description'),
                  validator: (String? value) {
                    if (value?.isEmpty == true) {
                      return 'Enter your description';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                GetBuilder<CreateReviewController>(
                    builder: (createReviewController) {
                  if (createReviewController.getCreateReviewInProgress) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        createReviewController.getCreateReview(
                            // _firstNameTEController.text,
                            // _lastNameTEController.text,
                            _descriptionNameTEController.text,
                            widget.productId,
                            _rating
                        ).then((result){
                          if(result){
                            if(mounted) {
                              showSnackMessage(
                                  context, 'Add review successful.');
                              Get.find<ProductReviewController>().getProductReview(widget.productId);
                              // Get.to(() =>  ReviewListScreen(productId: widget.productId,));
                              Get.to(() =>  ReviewListScreen(productId: widget.productId,));

                            }
                          }else{
                            if(mounted) {
                              showSnackMessage(
                                  context, 'Add review has been failed.');
                              Get.to(() =>  ReviewListScreen(productId: widget.productId,));
                            }
                          }
                        });
                      }
                     
                    },
                    child: const Text('Submit'),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

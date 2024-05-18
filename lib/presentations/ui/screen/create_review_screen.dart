import 'package:crafty_bay/presentations/ui/screen/reviews_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key});

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'First Name'
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Last Name'
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                maxLines: 8,
                decoration: const InputDecoration(
                    hintText: 'Last Name'
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(onPressed: (){
                Get.offAll(()=>const ReviewListScreen());
              }, child: const Text('Submit'),),
            ],
          ),
        ),
      ),
    );
  }
}

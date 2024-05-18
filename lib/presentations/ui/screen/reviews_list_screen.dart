import 'package:flutter/material.dart';

class ReviewListScreen extends StatefulWidget {
  const ReviewListScreen({super.key});

  @override
  State<ReviewListScreen> createState() => _ReviewListScreenState();
}

class _ReviewListScreenState extends State<ReviewListScreen> {
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
      body:  ListView.builder(
          itemCount: 4,
          itemBuilder: (context,index){
        return _buildReviewCard();
      })
    );
  }

  Padding _buildReviewCard() {
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
                           Text('Robiul Hassan',style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade700,
                          ),),
                        ],
                      ),
                      const Text('''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.''',style: TextStyle(
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

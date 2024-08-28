
import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/data/network_caller/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class CreateReviewController extends GetxController{
  bool _getReviewInProgress = false;
  String _errorMessage='';

  bool get getCreateReviewInProgress => _getReviewInProgress;
  String get errorMessage =>_errorMessage;



  Future<bool> getCreateReview(String description, int productId, double rating) async {
    bool isSuccess= false;
    _getReviewInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.postRequest(url: Urls.getCreateReview,body: {
      "description" : description,
      "product_id": productId,
      "rating" : rating,
    });
    if(response.isSuccess){
      isSuccess = true;
    }else{
      _errorMessage= response.errorMessage;
    }
    _getReviewInProgress = false;
    update();
    return isSuccess;
  }
}
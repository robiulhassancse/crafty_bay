import 'package:crafty_bay/data/model/category/cart_item.dart';
import 'package:crafty_bay/data/model/category/cart_list_model.dart';
import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/data/model/review/product_review_model.dart';
import 'package:crafty_bay/data/model/review/review_data.dart';
import 'package:crafty_bay/data/network_caller/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class ProductReviewController extends GetxController {
  bool _getProductReviewInProgress = false;
  String _errorMessage = '';

  List<ReviewData> _reviewList = [];

  bool get getProductReviewInProgress => _getProductReviewInProgress;

  String get errorMessage => _errorMessage;

  List<ReviewData> get reviewList => _reviewList;

  Future<bool> getProductReview(int productId) async {
    bool isSuccess = false;
    _getProductReviewInProgress = true;
    update();
    final NetworkResponse response =
    await NetworkCaller.getRequest(url: Urls.getListReviewByProduct(productId));
    if (response.isSuccess) {
      _reviewList = ProductReviewData.fromJson(response.responseData).data ?? [];
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _getProductReviewInProgress = false;
    update();
    return isSuccess;
  }

}

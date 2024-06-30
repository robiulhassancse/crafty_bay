import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/data/network_caller/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class AddToWishListController extends GetxController {
  bool _getAddToWishListInProgress = false;
  String _errorMessage = '';

  bool get getAddToWishListInProgress => _getAddToWishListInProgress;

  String get errorMessage => _errorMessage;

  Future<bool> getAddToWishList(int productId) async {
    bool isSuccess = false;
    _getAddToWishListInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.postRequest(
        url: Urls.getAddToWishList(productId));
    if (response.isSuccess) {
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _getAddToWishListInProgress = false;
    update();
    return isSuccess = true;
  }
}

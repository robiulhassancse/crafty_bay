import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/data/network_caller/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';


class DeleteProductListController extends GetxController {
  bool _deleteWishListProductInProgress = false;
  String _errorMessage = '';

  bool get deleteWishListInProgress => _deleteWishListProductInProgress;

  String get errorMessage => _errorMessage;


  Future<bool> deleteWishList(int productId) async {
    bool isSuccess = false;
    _deleteWishListProductInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
        url: Urls.getDeleteCartProductListProduct(productId));
    if (response.isSuccess) {
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _deleteWishListProductInProgress = false;
    update();
    return isSuccess;
  }
}

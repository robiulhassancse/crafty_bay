import 'package:crafty_bay/data/model/category/cart_model.dart';
import 'package:crafty_bay/data/model/category/category_data.dart';
import 'package:crafty_bay/data/model/category/category_model_list.dart';
import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/data/model/slider/slider_data.dart';
import 'package:crafty_bay/data/model/slider/slider_model.dart';
import 'package:crafty_bay/data/network_caller/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class AddToCartController extends GetxController {
  bool _getAddToCartInProgress = false;
  String _errorMessage = '';

  bool get getAddToCartInProgress => _getAddToCartInProgress;

  String get errorMessage => _errorMessage;

  Future<bool> getAddToCart(CartModel cartModel) async {
    bool isSuccess = false;
    _getAddToCartInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.postRequest(
        url: Urls.getAddToCart, body: cartModel.toJson());
    if (response.isSuccess) {
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _getAddToCartInProgress = false;
    update();
    return isSuccess = true;
  }
}

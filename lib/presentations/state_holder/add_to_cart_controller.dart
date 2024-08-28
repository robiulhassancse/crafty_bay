// import 'package:crafty_bay/data/model/category/cart_model.dart';
// import 'package:crafty_bay/data/model/category/category_data.dart';
// import 'package:crafty_bay/data/model/category/category_model_list.dart';
// import 'package:crafty_bay/data/model/network_response.dart';
// import 'package:crafty_bay/data/model/slider/slider_data.dart';
// import 'package:crafty_bay/data/model/slider/slider_model.dart';
// import 'package:crafty_bay/data/network_caller/network_caller.dart';
// import 'package:crafty_bay/data/utility/urls.dart';
// import 'package:get/get.dart';
//
// class AddToCartController extends GetxController {
//   bool _getAddToCartInProgress = false;
//   String _errorMessage = '';
//
//   bool get getAddToCartInProgress => _getAddToCartInProgress;
//
//   String get errorMessage => _errorMessage;
//
//   Future<bool> getAddToCart(CartModel cartModel) async {
//     bool isSuccess = false;
//     _getAddToCartInProgress = true;
//     update();
//     final NetworkResponse response = await NetworkCaller.postRequest(
//         url: Urls.getAddToCart, body: cartModel.toJson());
//     if (response.isSuccess) {
//       isSuccess = true;
//     } else {
//       _errorMessage = response.errorMessage;
//     }
//     _getAddToCartInProgress = false;
//     update();
//     return isSuccess = true;
//   }
// }


import 'dart:developer';


import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/data/network_caller/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class AddToCartController extends GetxController {
  bool _addToCartInProgress = false;
  String _message = '';

  bool get addToCartInProgress => _addToCartInProgress;

  String get message => _message;

  Future<bool> addToCart(
      int productId, String color, String size, int quantity) async {
    bool isSuccess = false;
    _addToCartInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.postRequest( url:
        Urls.getAddToCart, body: {
      "product_id": productId,
      "color": color,
      "size": size,
      "qty": quantity
    });

    log(productId.toString());
    log('color: $color');
    log('Size: $size');
    _addToCartInProgress = false;
    update();
    if (response.isSuccess) {
      isSuccess = true;
    } else {
      _message = 'Add to cart failed! Try again';
      return false;
    }
    _addToCartInProgress = false;
    update();
    return isSuccess = true;
  }
}
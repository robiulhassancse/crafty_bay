import 'package:crafty_bay/data/model/category/cart_item.dart';
import 'package:crafty_bay/data/model/category/cart_list_model.dart';
import 'package:crafty_bay/data/model/category/product.dart';
import 'package:crafty_bay/data/model/category/product_list_by_category_model.dart';
import 'package:crafty_bay/data/model/category/wish_list_item_model.dart';
import 'package:crafty_bay/data/model/category/wish_list_model.dart';
import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/data/network_caller/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class CartListController extends GetxController {
  bool _getCartListInProgress = false;
  String _errorMessage = '';

  List<CartItemModel> _cartList =[];

  bool get getCartListInProgress => _getCartListInProgress;

  String get errorMessage => _errorMessage;

  List<CartItemModel> get cartList => _cartList;

  Future<bool> getCartItem() async {
    bool isSuccess = false;
    _getCartListInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.postRequest(
        url: Urls.getWishList);
    if (response.isSuccess) {
      _cartList = CartListModel.fromJson(response.responseData).cartList ?? [];
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _getCartListInProgress = false;
    update();
    return isSuccess = true;
  }
}

// import 'package:crafty_bay/data/model/category/cart_item.dart';
// import 'package:crafty_bay/data/model/category/cart_list_model.dart';
// import 'package:crafty_bay/data/model/network_response.dart';
// import 'package:crafty_bay/data/network_caller/network_caller.dart';
// import 'package:crafty_bay/data/utility/urls.dart';
// import 'package:get/get.dart';
//
// class CartListController extends GetxController {
//   bool _getCartListInProgress = false;
//   String _errorMessage = '';
//
//   List<CartItemModel> _cartList = [];
//
//   bool get getCartListInProgress => _getCartListInProgress;
//
//   String get errorMessage => _errorMessage;
//
//   List<CartItemModel> get cartList => _cartList;
//
//   Future<bool> getCartItem() async {
//     bool isSuccess = false;
//     _getCartListInProgress = true;
//     update();
//     final NetworkResponse response =
//         await NetworkCaller.getRequest(url: Urls.getCartList);
//     if (response.isSuccess) {
//       _cartList = CartListModel.fromJson(response.responseData).cartList ?? [];
//       isSuccess = true;
//     } else {
//       _errorMessage = response.errorMessage;
//     }
//     _getCartListInProgress = false;
//     update();
//     return isSuccess;
//   }
//
//   double get totalPrice {
//     double total = 0;
//     for (CartItemModel cartItemModel in _cartList) {
//       total += (double.tryParse(cartItemModel.qty ?? '1') ?? 1) *
//           (double.tryParse(cartItemModel.product?.price ?? '0') ?? 0);
//     }
//     return total;
//   }
// }


import 'package:crafty_bay/data/model/category/cart_item.dart';
import 'package:crafty_bay/data/model/category/cart_list_model.dart';
import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/data/network_caller/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class CartListController extends GetxController {
  bool _getCartProductsInProgress = false;
  CartListModel _cartListModel = CartListModel();
  String _message = '';
  double _totalPrice = 0;

  double get totalPrice => _totalPrice;

  CartListModel get cartListModel => _cartListModel;

  bool get getCartProductsInProgress => _getCartProductsInProgress;

  String get message => _message;

  Future<bool> getCartProducts() async {
    _getCartProductsInProgress = true;
    update();
    final NetworkResponse response =
    await NetworkCaller.getRequest(url : Urls.getCartList, formAuth: true,);
    _getCartProductsInProgress = false;
    if (response.isSuccess) {
      _cartListModel = CartListModel.fromJson(response.responseData ?? {});
      update();
      return true;
    } else {
      _message = 'Cart list data fetch failed!';
      update();
      return false;
    }
  }
  // double get totalPrice {
  //   double total = 0;
  //   for (CartItemModel cartItemModel in _cartList) {
  //     total += (double.tryParse(cartItemModel.qty ?? '1') ?? 1) *
  //         (double.tryParse(cartItemModel.product?.price ?? '0') ?? 0);
  //   }
  //   return total;
  // }

  // void changeItem(int cartProductId, int noOfItems) {
  //   _cartListModel.data
  //       ?.firstWhere((cartData) => cartData.productId == cartProductId)
  //       .qty = noOfItems.toString();
  //   _calculateTotalPrice();
  // }

  // void _calculateTotalPrice() {
  //   _totalPrice = 0;
  //   for (CartListData data in _cartListModel.data ?? []) {
  //     _totalPrice += (int.parse(data.qty!) *
  //         (double.tryParse(data.product?.price ?? '0') ?? 0));
  //   }
  //   update();
  // }
}

import 'package:crafty_bay/data/model/category/product.dart';
import 'package:crafty_bay/data/model/category/product_list_by_category_model.dart';
import 'package:crafty_bay/data/model/category/wish_list_item_model.dart';
import 'package:crafty_bay/data/model/category/wish_list_model.dart';
import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/data/network_caller/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class WishListController extends GetxController {
  bool _getWishListInProgress = false;
  String _errorMessage = '';

  List<WishListItem> _wishList =[];

  bool get getWishListInProgress => _getWishListInProgress;

  String get errorMessage => _errorMessage;

  List<WishListItem> get wishList => _wishList;

  Future<bool> getWishList() async {
    bool isSuccess = false;
    _getWishListInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.postRequest(
        url: Urls.getWishList);
    if (response.isSuccess) {
      _wishList = WishListModel.formJson(response.responseData).wishList ?? [];
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _getWishListInProgress = false;
    update();
    return isSuccess = true;
  }
}

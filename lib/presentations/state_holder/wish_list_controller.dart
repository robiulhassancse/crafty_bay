import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/data/model/wish_list_model/wish_list_item.dart';
import 'package:crafty_bay/data/model/wish_list_model/wish_list_model.dart';
import 'package:crafty_bay/data/network_caller/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class WishListController extends GetxController {
  bool _getWishListInProgress = false;
  String _errorMessage = '';

  List<WishListItem> _wishList = [];
  List<WishListItem> get wishList => _wishList;

  bool get getWishListInProgress => _getWishListInProgress;

  String get errorMessage => _errorMessage;

  Future<bool> getWishList() async {
    bool isSuccess = false;
    _getWishListInProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller.getRequest(url: Urls.getWishList);

    if (response.isSuccess) {
     _wishList = WishListModel.fromJson(response.responseData).data ?? [];
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _getWishListInProgress = false;
    update();

    return isSuccess;
  }
}

import 'package:crafty_bay/data/model/category/wish_list_item_model.dart';

class WishListModel {
  String? msg;
  List<WishListItem>? wishList;

  WishListModel({
    this.msg,
    this.wishList,
  });

  WishListModel.formJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data' != null]) {
      wishList = <WishListItem>[];
      json['data'].forEach((v) {
        wishList!.add(WishListItem.formJson(v));
      });
    }
  }
}

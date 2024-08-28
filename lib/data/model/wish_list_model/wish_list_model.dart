import 'package:crafty_bay/data/model/wish_list_model/wish_list_item.dart';

class WishListModel {
  String? msg;
  List<WishListItem>? data;

  WishListModel({this.msg, this.data});

  WishListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <WishListItem>[];
      json['data'].forEach((v) {
        data!.add(WishListItem.fromJson(v));
      });
    }
  }
}




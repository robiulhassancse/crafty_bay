import 'package:crafty_bay/data/model/category/product.dart';

class WishListItem{
  int? id;
  int? productId;
  int? userId;
  String? createdAt;
  String? updatedAt;
  Product? product;

  WishListItem({
    this.id,
    this.productId,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.product
});
  WishListItem.formJson(Map<String,dynamic> json){
    id = json['id'];
    productId = json['productId'];
    userId = json['userId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    product = json['product'] != null ? Product.fromJson(json['product']): null;
  }
}
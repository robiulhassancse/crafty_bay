import 'package:crafty_bay/data/model/category/product_details_model.dart';

class ProductDetailsWrapper {
  String? msg;
  List<ProductDetailsModel>? productDetails;

  ProductDetailsWrapper({this.msg, this.productDetails});

  ProductDetailsWrapper.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      productDetails = <ProductDetailsModel>[];
      json['data'].forEach((v) {
        productDetails!.add(ProductDetailsModel.fromJson(v));
      });
    }
  }
}









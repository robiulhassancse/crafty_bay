import 'package:crafty_bay/data/model/category/product.dart';
import 'package:crafty_bay/data/model/category/product_list_by_category_model.dart';
import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/data/network_caller/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class ProductListByCategoryController extends GetxController{
  bool _getProductListInProgress = false;
  String _message='';
  List<Product> _productList = [];
  bool get getProductListInProgress => _getProductListInProgress;
  String get message =>_message;

  List<Product> get productList => _productList;

  Future<bool>getProductList(int categoryId) async {
    bool isSuccess= false;
    _getProductListInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(url: Urls.getProductListByCategory(categoryId));
    if(response.isSuccess){
      _productList = ProductListByCategoryModel.fromJson(response.responseData).productList ?? [];
    }else{
      _message= response.errorMessage;
    }
    _getProductListInProgress = false;
    update();
    return isSuccess=true;
  }
}
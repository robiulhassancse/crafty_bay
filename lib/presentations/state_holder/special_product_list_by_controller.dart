import 'package:crafty_bay/data/model/category/product.dart';
import 'package:crafty_bay/data/model/category/product_list_by_category_model.dart';
import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/data/network_caller/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class SpecialProductListByController extends GetxController{
  bool _specialProductListInProgress = false;
  String _errorMessage = '';
  List<Product> _specialProductList=[];

  bool get specialProductListInProgress => _specialProductListInProgress;
  String get errorMessage => _errorMessage;
  List<Product> get specialProductList => _specialProductList;

  Future<bool> getSpecialProductList() async{
    bool isSuccess = false;
    _specialProductListInProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller.getRequest(url: Urls.getProductListByRemark('Special'));
    if(response.isSuccess){
      _specialProductList = ProductListByCategoryModel.fromJson(response.responseData).productList ?? [];
      isSuccess = true;
    }else{
      _errorMessage = response.errorMessage;
    }
    _specialProductListInProgress = false;
    update();
    return isSuccess;
  }
}
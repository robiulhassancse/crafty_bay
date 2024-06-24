import 'package:crafty_bay/data/model/category/product.dart';
import 'package:crafty_bay/data/model/category/product_list_by_category_model.dart';
import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/data/network_caller/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class PopularListByRemarkController extends GetxController{
  bool _popularProductListInProgress = false;
  String _errorMessage='';
  List<Product>_popularProductList=[];
  
  bool get popularProductListInProgress => _popularProductListInProgress;
  String get errorMessage => _errorMessage;
  List<Product> get popularProductList => _popularProductList;
  
  Future<bool> getPopularProductList() async{
    bool isSuccess = false;
    _popularProductListInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(url: Urls.getProductListByRemark('Popular'));
    if(response.isSuccess){
      _popularProductList = ProductListByCategoryModel.fromJson(response.responseData).productList ?? [];
      isSuccess = true;
    }else{
      _errorMessage = response.errorMessage;
    }
    _popularProductListInProgress = false;
    update();
    return isSuccess;

  }
}
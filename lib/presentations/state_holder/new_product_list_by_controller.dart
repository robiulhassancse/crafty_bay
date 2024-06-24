import 'package:crafty_bay/data/model/category/product.dart';
import 'package:crafty_bay/data/model/category/product_list_by_category_model.dart';
import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/data/network_caller/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class NewProductListController extends GetxController{
  bool _newProductListInProgress = false;
  String _errorMessage ='';
  List<Product> _newProductList =[];

  bool get newProductListInProgress => _newProductListInProgress;
  String get errorMessage => _errorMessage;
  List<Product> get newProductList => _newProductList;

  Future<bool> getNewProductList() async{
    bool isSuccess= false;
    _newProductListInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(url: Urls.getProductListByRemark('New'));
    if(response.isSuccess){
      _newProductList = ProductListByCategoryModel.fromJson(response.responseData).productList ?? [];
      isSuccess = true;
    }else{
      _errorMessage =response.errorMessage;
    }
    _newProductListInProgress = false;
    update();
    return isSuccess;
  }
}
import 'package:crafty_bay/data/model/category/product_details_model.dart';
import 'package:crafty_bay/data/model/category/product_details_wrapper.dart';
import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/data/network_caller/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController{
  bool _productDetailsInProgress = false;
  String _errorMessage='';
  ProductDetailsModel _productDetailsModel =ProductDetailsModel();

  bool get productDetailsInProgress => _productDetailsInProgress;
  String get errorMessage => _errorMessage;
  ProductDetailsModel get productDetailsModel => _productDetailsModel;

  Future<bool> getProductDetails(int productID) async{
    bool isSuccess = false;
    _productDetailsInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(url: Urls.getProductDetails(productID));
    if(response.isSuccess){
      if(_errorMessage.isNotEmpty){
        _errorMessage ='';
      }
      _productDetailsModel = ProductDetailsWrapper.fromJson(response.responseData).productDetails!.first;
    }else{
      _errorMessage = response.errorMessage;
    }
    _productDetailsInProgress= false;
    update();
    return isSuccess;
  }

}
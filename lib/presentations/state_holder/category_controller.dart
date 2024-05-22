import 'package:crafty_bay/data/model/category/category_data.dart';
import 'package:crafty_bay/data/model/category/category_model_list.dart';
import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/data/model/slider/slider_data.dart';
import 'package:crafty_bay/data/model/slider/slider_model.dart';
import 'package:crafty_bay/data/network_caller/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{
  bool _getCategoryInProgress = false;
  String _message='';
  List<CategoryData> _categoryList = [];
  bool get getCategoryInProgress => _getCategoryInProgress;
  String get message =>_message;

  List<CategoryData> get categoryList => _categoryList;

  Future<bool>getCategory() async {
    bool isSuccess= false;
    _getCategoryInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(url: Urls.getCategory);
    if(response.isSuccess){
      _categoryList = CategoryModel.fromJson(response.responseData).data ?? [];
    }else{
      _message= response.errorMessage;
    }
    _getCategoryInProgress = false;
    update();
    return isSuccess=true;
  }
}
import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/data/model/slider/slider_data.dart';
import 'package:crafty_bay/data/model/slider/slider_model.dart';
import 'package:crafty_bay/data/network_caller/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class HomeSliderController extends GetxController{
  bool _getHomeSlidersInProgress = false;
  String _errorMessage='';
  List<SliderData> _sliderList=[];
  bool get getHomeSliderInProgress =>_getHomeSlidersInProgress;
  String get errorMessage =>_errorMessage;
  List <SliderData> get sliderList=>_sliderList;

  Future<bool> getHomeSlider()async{
    bool isSuccess=false;
    _getHomeSlidersInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(url:Urls.getHomeSlider);
    if(response.isSuccess){
      _sliderList=SliderModel.fromJson(response.responseData).data ?? [];
    }else{
        _errorMessage= response.errorMessage;
    }
    _getHomeSlidersInProgress = false;
    update();
    return isSuccess;
  }
}
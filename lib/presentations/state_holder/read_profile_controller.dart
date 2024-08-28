import 'package:crafty_bay/data/model/category/category_data.dart';
import 'package:crafty_bay/data/model/category/category_model_list.dart';
import 'package:crafty_bay/data/model/create_profile/create_profile.dart';
import 'package:crafty_bay/data/model/create_profile/create_profile_model.dart';
import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/data/model/slider/slider_data.dart';
import 'package:crafty_bay/data/model/slider/slider_model.dart';
import 'package:crafty_bay/data/model/user_profile/read_profile_model.dart';
import 'package:crafty_bay/data/network_caller/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class ReadProfileController extends GetxController{
  bool _readProfileInProgress = false;
  String _errorMessage='';
  // List<ReadProfileModel> _readProfileModel = [];
  ReadProfileModel _readProfileModel = ReadProfileModel();
  bool get getReadProfileInProgress => _readProfileInProgress;
  String get errorMessage =>_errorMessage;

  // List<ReadProfileModel> get createProfileList => _readProfileModel;
  ReadProfileModel get readProfileModel => _readProfileModel;

  Future<bool>readProfile() async {
    bool isSuccess= false;
    _readProfileInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(url: Urls.getReadProfile, formAuth: true);
    if(response.isSuccess){
      // _readProfileModel = ReadProfileModel.fromJson(response.responseData ?? {}).profileDataList ?? [];
      // _readProfileModel = (response.responseData as List).map((e) => ReadProfileModel.fromJson(e)).toList();
      _readProfileModel = ReadProfileModel.fromJson(response.responseData);
      isSuccess = true;
    }else{
      _errorMessage= response.errorMessage;
    }
    _readProfileInProgress = false;
    update();
    return isSuccess;
  }
}
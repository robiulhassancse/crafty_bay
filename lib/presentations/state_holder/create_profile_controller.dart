import 'package:crafty_bay/data/model/create_profile/create_profile.dart';
import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/data/network_caller/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';


class CreateProfileController extends GetxController {
  bool _createProfileInProgress = false;
  String _errorMessage = '';

  bool get createProfileInProgress => _createProfileInProgress;

  String get errorMessage => _errorMessage;


  Future<bool> createProfile(ProfileData profileModel) async {
    bool isSuccess = false;
    _createProfileInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.postRequest(
        url: Urls.getCreateProfile, body : profileModel.toJson());
    if (response.isSuccess) {
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _createProfileInProgress = false;
    update();
    return isSuccess;
  }
}

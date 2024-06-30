
import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/data/network_caller/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  bool _getVerifyEmailInProgress = false;
  String _errorMessage = '';

  bool get getVerifyEmailInProgress => _getVerifyEmailInProgress;

  String get errorMessage => _errorMessage;

  Future<bool> getVerifyEmail(String email) async {
    bool isSuccess = false;
    _getVerifyEmailInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
        url: Urls.getVerifyEmail(email));
    if (response.isSuccess) {
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _getVerifyEmailInProgress = false;
    update();
    return isSuccess;
  }
}

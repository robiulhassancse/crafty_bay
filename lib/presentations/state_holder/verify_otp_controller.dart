
import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/data/network_caller/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class VerifyOtpController extends GetxController {
  bool _getVerifyOtpInProgress = false;
  String _errorMessage = '';

  bool get getVerifyOtpInProgress => _getVerifyOtpInProgress;

  String get errorMessage => _errorMessage;

  Future<bool> getVerifyOtp(String email,String otp) async {
    bool isSuccess = false;
    _getVerifyOtpInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
        url: Urls.getVerifyOtp(email,otp));
    if (response.isSuccess) {
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _getVerifyOtpInProgress = false;
    update();
    return isSuccess;
  }
}
